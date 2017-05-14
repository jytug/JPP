-- this module exports semantic functions
-- for interpreting the language
module Interpreter where

-- local imports
import Common

import AbsLang
import ErrM
import LexLang
import ParLang

-- global imports
import Control.Monad.Except
import Control.Monad.State
import Data.Functor.Identity

-- semantic errors
err_invalid_for   = "poor attempt to use a for loop"
err_zero_division = "attempt to divide by zero"

-- semantic domains
data VarMeaning
    = NotThere
    | VarInt Integer
    | VarBool Bool
    | VarFun Func
    | VarFunRef FuncRef
    | VarFunFun FuncFun

type Loc = Integer
type Store = Loc -> VarMeaning
type IState = ([Env], Store, RHan, Loc)

pushEnv, popEnv :: IState -> IState
pushEnv = applyFst pushState
popEnv = applyFst popState

initialIState :: IState
initialIState = ([const 0], const NotThere, NotReturned, 0)

type Env = Ident -> Loc

type Func     = Integer -> Store -> InterpreterM (Store, Integer)
type FuncRef  = Loc -> Store -> InterpreterM (Store, Integer)
type FuncFun  = Func -> Store -> InterpreterM (Store, Integer)
data RHan
    = Returned Integer
    | NotReturned

-- the monad to work under
type InterpreterM a = ExceptStateM IState IO a

-- the exported function
runProg :: Prog -> IO (Either String ())
runProg p = fmap fst $ (flip runStateT) initialIState $
             runExceptT $ interpretProg p

-- helper functions
updateEnv :: Ident -> Loc -> IState -> IState
updateEnv x l (env:envs, s, rh, loc) =
    ((\y -> if y == x then l else env y):envs, s, rh, loc)

updateStore :: Loc -> VarMeaning -> IState -> IState
updateStore l vm (envs, s, rh, loc) =
    (envs, \l' -> if l' == l then vm else s l', rh, loc)

updateLoc :: (Loc -> Loc) -> IState -> IState
updateLoc f (envs, s, rh, loc) =
    (envs, s, rh, f loc)

newLoc :: InterpreterM Loc
newLoc = do
    modify $ updateLoc (+1)
    (\state -> frth4 state) <$> get

translateType :: Type -> VarMeaning
translateType TInt = VarInt 0
translateType TBool = VarBool False

-- the semantic function types
interpretProg   :: Prog -> InterpreterM ()
interpretStm    :: Stm  -> InterpreterM ()
interpretExp    :: Exp  -> InterpreterM VarMeaning
interpretDecl   :: Decl -> InterpreterM ()

-- the semantic functions implementation

-- program
interpretProg (Program stm) = interpretStm stm

-- statements

-- assignment
interpretStm (SAss x e) = do
    (env:envs, store, _, _) <- get
    emeaning <- interpretExp e 
    modify $ updateStore (env x) emeaning

-- while loop
interpretStm (SWhile b stm) = do
    (VarBool bm) <- interpretExp b
    if bm then do
        interpretStm stm
        (_, _, rh, _) <- get
        case rh of
            Returned _ -> return ()
            otherwise  -> interpretStm (SWhile b stm)
    else
        return ()

-- if
interpretStm (SIf b stm) = do
    (VarBool bm) <- interpretExp b
    if bm then
        interpretStm stm
    else
        return ()

-- if-else
interpretStm (SIfEl b stm1 stm2) = do
    (VarBool bm) <- interpretExp b
    if bm then
        interpretStm stm1
    else
        interpretStm stm2

-- block
interpretStm (SBlock decls stms) = do
    modify pushEnv
    mapM_ interpretDecl decls
    mapBlock stms
    modify popEnv
    where
        mapBlock (stm:stms) = do
            interpretStm stm
            (_, _, rh, _) <- get
            case rh of
                Returned _ -> return ()
                otherwise  -> mapBlock stms
        mapBlock [] = return ()

-- print
interpretStm (SPrint e) = do
    (VarInt n) <- interpretExp e
    liftIO $ putStrLn $ show n

-- for (does this work?)
interpretStm (SFor x e1 e2 stm) = do
    (env:envs, st, _, _) <- get
    [VarInt n1, VarInt n2] <- mapM interpretExp [e1, e2]
    case (st . env $ x) of
        (VarInt _) -> do
            if (n1 <= n2) then do
                modify $ updateStore (env x) (VarInt n1)
                interpretStm stm
                (_, _, rh, _) <- get
                case rh of
                    Returned _ -> return ()
                    otherwise  -> interpretStm (SFor x (EAdd e1 (EInt 1)) e2 stm)
            else
                return ()
        otherwise  -> do
            modify pushEnv
            l <- newLoc
            modify $ updateEnv x l
            interpretStm (SFor x e1 e2 stm)
            modify popEnv

-- return, yield (TODO)
interpretStm (SRet e) = do
    (VarInt n) <- interpretExp e
    (envs, st, _, l) <- get
    put (envs, st, Returned n, l)
    return ()

interpretStm (SYield e) = interpretStm (SRet e)
    
-- expressions

-- generic functions
-- for arithmetic
interpretBinaryOp ::
    Bool -> Exp -> Exp -> (Integer -> Integer -> Integer) -> InterpreterM VarMeaning
interpretBinaryOp check_zero e1 e2 op = do
    [VarInt n1, VarInt n2] <- mapM interpretExp [e1, e2]
    if check_zero && n2 == 0 then
        throwError err_zero_division
    else
        return $ VarInt $ op n1 n2

-- for increment / decrement
interpretUnaryChange :: Ident -> (Integer -> Integer) -> InterpreterM VarMeaning
interpretUnaryChange x op = do
    (env:envs, st, _, _) <- get
    let l = env x
    let (VarInt n) = st l
    modify $ updateStore l (VarInt $ op n)
    return $ VarInt $ op n

-- for comparisons
interpretComparison ::
    Exp -> Exp -> (Integer -> Integer -> Bool) -> InterpreterM VarMeaning
interpretComparison e1 e2 cmp = do
    [VarInt n1, VarInt n2] <- mapM interpretExp [e1, e2]
    return $ VarBool $ n1 `cmp` n2

-- for binary boolean operators
interpretBinaryBOp :: Exp -> Exp -> (Bool -> Bool -> Bool) -> InterpreterM VarMeaning
interpretBinaryBOp b1 b2 op = do
    [VarBool bm1, VarBool bm2] <- mapM interpretExp [b1, b2]
    return $ VarBool $ bm1 `op` bm2
    
interpretExp (EAdd e1 e2) = interpretBinaryOp False e1 e2 (+)
interpretExp (ESub e1 e2) = interpretBinaryOp False e1 e2 (-)
interpretExp (EMul e1 e2) = interpretBinaryOp False e1 e2 (*)
interpretExp (EDiv e1 e2) = interpretBinaryOp True e1 e2 quot

interpretExp (EInt n) = return $ VarInt n

-- function call
interpretExp (ECall f e) = do
    (env:envs, st, rh, loc) <- get
    case st . env $ f of
        VarFun fun    -> do
            (VarInt n) <- interpretExp e
            (newSt, rVal) <- fun n st
            put (env:envs, newSt, rh, loc)
            return $ VarInt rVal
        VarFunFun fun -> do
            (VarFun g) <- interpretExp e
            (newSt, rVal) <- fun g st
            put (env:envs, newSt, rh, loc)
            return $ VarInt rVal
        VarFunRef fun -> throwError "this doesn't work yet!"

-- increment, decrement
interpretExp (EInc x) = interpretUnaryChange x (+1)
interpretExp (EDec x) = interpretUnaryChange x (flip (-) $ 1)

-- variable
interpretExp (EVar x) = do interpretUnaryChange x id

-- boolean constants
interpretExp (BTrue) = return $ VarBool True
interpretExp (BFalse) = return $ VarBool False

-- comparisons
interpretExp (BLe e1 e2) = interpretComparison e1 e2 (<=)
interpretExp (BLt e1 e2) = interpretComparison e1 e2 (<)
interpretExp (BGe e1 e2) = interpretComparison e1 e2 (>=)
interpretExp (BGt e1 e2) = interpretComparison e1 e2 (>)
interpretExp (BEq e1 e2) = interpretComparison e1 e2 (==)

-- boolean operations
interpretExp (BCon b1 b2) = interpretBinaryBOp b1 b2 (&&)
interpretExp (BAlt b1 b2) = interpretBinaryBOp b1 b2 (||)

interpretExp (BNeg b) = do
    (VarBool bm) <- interpretExp b
    return $ VarBool $ not bm

-- lambdas
interpretExp (FLam x stm) = do
    let fun :: Func
        fun n st = do
            modify pushEnv
            l <- newLoc
            modify $ updateEnv x l
            modify $ updateStore l (VarInt n)
            interpretStm stm
            (_, st, rh, _) <- get
            modify popEnv
            case rh of
                Returned rVal -> return (st, rVal)
                otherwise     -> return (st, 0)
    return $ VarFun $ fun
      
-- declarations
interpretDecl (DVar tp x) = do
    l <- newLoc
    modify $ updateEnv x l
    modify $ updateStore l (translateType tp) 

interpretDecl (DFun f x stm) = do
    let fun :: Func
        fun n st = do
            modify pushEnv
            l <- newLoc
            modify $ updateEnv x l
            modify $ updateStore l (VarInt n)
            l' <- newLoc
            modify $ updateEnv f l'
            modify $ updateStore l' (VarFun fun)
            interpretStm stm
            (_, st, rh, _) <- get
            modify popEnv
            case rh of
                Returned rVal -> return (st, rVal)
                otherwise     -> return (st, 0)
    l <- newLoc 
    modify $ updateEnv f l
    modify $ updateStore l (VarFun fun)
    return ()

interpretDecl (DRFun f x stm) = do
    let fun :: FuncRef
        fun l st = do
            modify pushEnv
            modify $ updateEnv x l
            l' <- newLoc
            modify $ updateEnv f l'
            modify $ updateStore l' (VarFunRef fun)
            interpretStm stm
            (_, st, rh, _) <- get
            modify popEnv
            case rh of
                Returned rVal -> return (st, rVal)
                otherwise     -> return (st, 0)
    l <- newLoc 
    modify $ updateEnv f l
    modify $ updateStore l (VarFunRef fun)
    return ()

interpretDecl (DFFun f x stm) = do
    let fun :: FuncFun
        fun g st = do
            modify pushEnv
            l <- newLoc
            modify $ updateEnv x l
            modify $ updateStore l (VarFun g)
            l' <- newLoc
            modify $ updateEnv f l'
            modify $ updateStore l' (VarFunFun fun)
            interpretStm stm
            (_, st, rh, _) <- get
            modify popEnv
            case rh of
                Returned rVal -> return (st, rVal)
                otherwise     -> return (st, 0)
    l <- newLoc 
    modify $ updateEnv f l
    modify $ updateStore l (VarFunFun fun)
    return ()
