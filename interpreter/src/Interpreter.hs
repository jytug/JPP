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
    | VarInt Int
    | VarBool Bool
    | VarFun Func
    | VarFunRef FuncRef
    | VarFunFun FuncFun

type Loc = Int
type Store = Loc -> VarMeaning
type IState = [(Env, Store, RHan, Loc)]

initialIState :: IState
initialIState = [(const 0, const NotThere, NotReturned, 0)]

type Env = Ident -> Loc

type Func     = Int -> Store -> (Store, Int)
type FuncRef  = Loc -> Store -> (Store, Int)
type FuncFun  = Func -> Store -> (Store, Int)
data RHan
    = Returned Int
    | NotReturned

-- the monad to work under
type InterpreterM a = ExceptStateM IState IO a

-- helper functions
updateEnv :: Ident -> Loc -> IState -> IState
updateEnv x l ((env, s, rh, loc):ss) =
    (\y -> if y == x then l else env y, s, rh, loc):ss

updateStore :: Loc -> VarMeaning -> IState -> IState
updateStore l vm ((env, s, rh, loc):ss) =
    (env, \l' -> if l' == l then vm else s l', rh, loc):ss

updateLoc :: (Loc -> Loc) -> IState -> IState
updateLoc f ((env, s, rh, loc):ss) =
    (env, s, rh, f loc):ss

newLoc :: InterpreterM Loc
newLoc = do
    modify $ updateLoc (+1)
    (\(s:ss) -> frth4 s) <$> get

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
    ((env, store, _, _):_) <- get
    emeaning <- interpretExp e 
    modify $ updateStore (env x) emeaning

-- while loop
interpretStm (SWhile b stm) = do
    (VarBool bm) <- interpretExp b
    if bm then do
        interpretStm stm
        interpretStm (SWhile b stm)
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
    modify pushState
    mapM_ interpretDecl decls
    mapM_ interpretStm stms
    modify popState

-- print
interpretStm (SPrint e) = do
    (VarInt n) <- interpretExp e
    liftIO $ putStrLn $ show n

-- for (does this work?)
interpretStm (SFor x e1 e2 stm) = do
    ((env, st, _, _):_) <- get
    [VarInt n1, VarInt n2] <- mapM interpretExp [e1, e2]
    case (st . env $ x) of
        (VarInt _) -> do
            if (n1 <= n2) then do
                modify $ updateStore (env x) (VarInt n1)
                interpretStm stm
                interpretStm (SFor x (EAdd e1 (EInt 1)) e2 stm)
            else
                return ()
        otherwise  -> do
            modify pushState
            l <- newLoc
            modify $ updateEnv x l
            interpretStm (SFor x e1 e2 stm)
            modify popState

-- return, yield (TODO)
interpretStm (SRet e) = do
    n <- interpretExp e
    return ()

interpretStm (SYield e) = interpretStm (SRet e)
    
-- expressions

-- arithmetic operations
interpretBinaryOp ::
    Bool -> Exp -> Exp -> (Int -> Int -> Int) -> InterpreterM VarMeaning
interpretBinaryOp check_zero e1 e2 op = do
    [VarInt n1, VarInt n2] <- mapM interpretExp [e1, e2]
    if check_zero && n2 == 0 then
        throwError err_zero_division
    else
        return $ VarInt $ op n1 n2
    
interpretExp (EAdd e1 e2) = interpretBinaryOp False e1 e2 (+)
interpretExp (ESub e1 e2) = interpretBinaryOp False e1 e2 (-)
interpretExp (EMul e1 e2) = interpretBinaryOp False e1 e2 (-)
interpretExp (EDiv e1 e2) = interpretBinaryOp True e1 e2 (-)

-- function call
interpretExp (ECall f e) = do
    ((env, st, rh, loc):ss) <- get
    case st . env $ f of
        VarFun fun    -> do
            (VarInt n) <- interpretExp e
            let newSt = fun n st
            put ((env, fst newSt, rh, loc):ss)
            return $ VarInt $ snd newSt
        VarFunFun fun -> do
            (VarFun g) <- interpretExp e
            let newSt = fun g st
            put ((env, fst newSt, rh, loc):ss)
            return $ VarInt $ snd newSt
        VarFunRef fun -> throwError "this doesn't work yet!"

-- increment, decrement
interpretUnaryChange :: Ident -> (Int -> Int) -> InterpreterM VarMeaning
interpretUnaryChange x op = do
    ((env, st, _, _):_) <- get
    let l = env x
    let (VarInt n) = st l
    modify $ updateStore l (VarInt $ op n)
    return $ VarInt $ op n

--interpretExp (EInc x) = interpretUnaryChange x (+1)
--interpretExp (EDec x) = interpretUnaryChange x (flip (-1) $ 1)

-- declarations
interpretDecl (DVar tp x) = do
    l <- newLoc
    modify $ updateEnv x l
    modify $ updateStore l (translateType tp) 

-- declarations
