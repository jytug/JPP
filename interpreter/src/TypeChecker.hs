-- this module exports functions for checking
-- the corectness of the program

module TypeChecker where

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

data ExpType
        = ExpInt
        | ExpBool
        | ExpFunFun
        | ExpFunInt
  deriving (Eq, Ord, Show, Read)

typeTranslate :: Type -> ExpType
typeTranslate TInt  = ExpInt
typeTranslate TBool = ExpBool

-- CState holds a stack of states
type CState = [Ident -> Either () ExpType]
type TCheckM a = ExceptStateM CState Identity a

pushState :: CState -> CState
pushState (s:ss) = s:s:ss

popState :: CState -> CState
popState (s:ss) = ss

updateCState :: Ident -> ExpType -> CState -> CState
updateCState x t (s:ss) = (\y -> if y == x then Right t else s y):ss

checkProgType   :: Prog   -> TCheckM ()
checkStmType    :: Stm    -> TCheckM ()
checkExpType    :: Exp    -> TCheckM ExpType
checkDeclType   :: Decl   -> TCheckM ()

-- program type check
checkProgType (Program stm) = checkStmType stm

-- statement type checks

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


-- expression type checks
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

-- declaration type checks
checkDeclType (DVar tp x) =
    modify $ updateCState x (typeTranslate tp)

{- checkDeclType (DFun f x Stm) = do -}

{- checkDeclType (DRFun f x Stm) = checkDeclType (DFun tp x Stm) -}

{- checkDeclType (DFFun f x) = -}
    {- modify $ updateCState x ExpFunFun -}
