-- this module exports functions for checking
-- the corectness of the program

module TypeChecker (typeProg) where

-- local imports
import Common

import AbsLang
import ErrM
import LexLang
import ParLang

-- global imports
import Control.Monad
import Control.Monad.State
import Control.Monad.Except
import Data.Functor.Identity

-- type errors
err_undecl      = "use of an undeclared variable"
err_mismatch    = "type mismatch"
err_non_bool    = "use of a non-boolean expression in wrong context"
err_non_int     = "use of a non-integer expression in wrong context"
err_non_call    = "attempt to call a non-callable"
err_wrong_call  = "poor attempt to call a function"
err_rvalue      = "attempt to pass a reference to an rvalue"

data ExpType
        = ExpInt
        | ExpBool
        | ExpFun
        | ExpFunRef
        | ExpFunFun
  deriving (Eq, Ord, Show, Read)

typeTranslate :: Type -> ExpType
typeTranslate TInt  = ExpInt
typeTranslate TBool = ExpBool

-- CState holds a stack of states
type CState = [Ident -> Either () ExpType]
type TCheckM a = ExceptStateM CState Identity a

updateCState :: Ident -> ExpType -> CState -> CState
updateCState x t (s:ss) = (\y -> if y == x then Right t else s y):ss

checkProgType   :: Prog   -> TCheckM ()
checkStmType    :: Stm    -> TCheckM ()
checkExpType    :: Exp    -> TCheckM ExpType
checkDeclType   :: Decl   -> TCheckM ()

-- the exported function
typeProg :: Prog -> Either String ()
typeProg p = fst $ runIdentity $ (flip runStateT) [const $ Left ()] $
             runExceptT $ checkProgType p

{- PROGRAM TYPE CHECK -}
checkProgType (Program stm) = checkStmType stm

{- STATEMENT TYPE CHECKS -}
-- assignment
checkStmType (SAss x e) = do
    et <- checkExpType e
    st <- get
    case (head st) x of
        Right xt -> if xt == et then return ()
                                else throwError err_mismatch
        Left ()  -> throwError err_undecl

-- while loop
checkStmType (SWhile b stm) = do
    bt <- checkExpType b
    checkStmType stm
    case bt of
        ExpBool   -> return ()
        otherwise -> throwError err_non_bool

-- if
checkStmType (SIf b stm) = checkStmType (SWhile b stm)

-- if-else
checkStmType (SIfEl b stm1 stm2) = do
    bt <- checkExpType b
    checkStmType stm1
    checkStmType stm2
    case bt of
        ExpBool   -> return ()
        otherwise -> throwError err_non_bool

-- block
checkStmType (SBlock decls stms) = do
    modify pushState
    mapM_ checkDeclType decls
    mapM_ checkStmType stms
    modify popState

-- print
checkStmType (SPrint e) = do
    et <- checkExpType e
    case et of
        ExpInt    -> return ()
        otherwise -> throwError err_non_int

-- for
checkStmType (SFor x e1 e2 stm) = do
    t1 <- checkExpType e1
    t2 <- checkExpType e2
    case (t1, t2) of
        (ExpInt, ExpInt) -> do
            modify pushState
            modify $ updateCState x ExpInt
            modify popState
        otherwise -> throwError err_non_int

-- return
checkStmType (SRet e) = do
    et <- checkExpType e
    case et of
        ExpInt    -> return ()
        otherwise -> throwError err_non_int

-- yield
checkStmType (SYield e) = checkStmType (SRet e)


{- EXPRESSION TYPE CHECKS -}
-- arithmetic operations
checkExpType (EAdd e1 e2) = do
    t1 <- checkExpType e1
    t2 <- checkExpType e2
    case (t1, t2) of (ExpInt, ExpInt) -> return ExpInt
                     otherwise        -> throwError err_mismatch

checkExpType (ESub e1 e2) = checkExpType (EAdd e1 e2)
checkExpType (EMul e1 e2) = checkExpType (EAdd e1 e2)
checkExpType (EDiv e1 e2) = checkExpType (EAdd e1 e2)

checkExpType (EInt _) = return ExpInt

-- function call
checkExpType (ECall f e) = do
    st <- get
    et <- checkExpType e
    case ((head st) f, et) of
        (Right ExpFun, ExpInt)    -> return ExpInt
        (Right ExpFunRef, _)
            -> case e of
                (EVar x)    -> return ExpInt
                otherwise -> throwError err_rvalue
        (Right ExpFunFun, ExpFun) -> return ExpInt
        (Left _, _)               -> throwError err_undecl
        otherwise                 -> throwError err_wrong_call

-- increment, decrement
checkExpType (EInc x) = do
    st <- get
    case (head st) x of
        Right ExpInt -> return ExpInt
        otherwise    -> throwError err_non_int

checkExpType (EDec x) = checkExpType (EInc x)

-- variable
checkExpType (EVar x) = do
    st <- get
    case (head st) x of
        Right tp -> return tp
        otherwie -> throwError err_undecl

-- boolean constants
checkExpType BTrue  = return ExpBool
checkExpType BFalse = return ExpBool

-- comparisons
checkExpType (BLe e1 e2) = do
    t1 <- checkExpType e1
    t2 <- checkExpType e2
    case (t1, t2) of
        (ExpInt, ExpInt) -> return ExpBool
        otherwise        -> throwError err_non_int


checkExpType (BLt e1 e2) = checkExpType (BLe e1 e2)
checkExpType (BGe e1 e2) = checkExpType (BLe e1 e2)
checkExpType (BGt e1 e2) = checkExpType (BLe e1 e2)
checkExpType (BEq e1 e2) = checkExpType (BLe e1 e2)

-- boolean operators
checkExpType (BCon b1 b2) = do
    t1 <- checkExpType b1
    t2 <- checkExpType b2
    case (t1, t2) of
        (ExpBool, ExpBool) -> return ExpBool
        otherwise          -> throwError err_non_int

checkExpType (BAlt b1 b2) = checkExpType (BCon b1 b2)

checkExpType (BNeg b) = do
    tb <- checkExpType b
    case tb of
        ExpBool   -> return ExpBool
        otherwise -> throwError err_non_bool

-- lambdas
checkExpType (FLam x stm) = do
    modify pushState
    modify $ updateCState x ExpInt
    checkStmType stm
    modify popState
    return ExpFun

-- declaration type checks
checkDeclType (DVar tp x) =
    modify $ updateCState x (typeTranslate tp)

checkDeclType (DFun f x stm) = do
    modify pushState
    modify $ updateCState f ExpFun
    modify $ updateCState x ExpInt
    checkStmType stm
    modify popState
    modify $ updateCState f ExpFun

checkDeclType (DRFun f x stm) = do
    modify pushState
    modify $ updateCState f ExpFunRef
    modify $ updateCState x ExpInt
    checkStmType stm
    modify popState
    modify $ updateCState f ExpFunRef

checkDeclType (DFFun f x stm) = do
    modify pushState
    modify $ updateCState f ExpFunFun
    modify $ updateCState x ExpFun
    checkStmType stm
    modify popState
    modify $ updateCState f ExpFunFun
