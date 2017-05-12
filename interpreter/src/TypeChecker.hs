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
import Data.Functor.Identity
import Control.Monad.Trans.State
import Control.Monad.Trans.Except

data ExpType = ExpInt | ExpBool | ExpFunFun | ExpFunInt

type CState = Ident -> Either () ExpType
type TCheckM a = ExceptStateM CState Identity a

checkProgType   :: Prog -> TCheckM ()
checkStmType    :: Stm -> TCheckM ()
checkExpType    :: Exp -> TCheckM ExpType
checkDeclType   :: Decl -> TCheckM ()

-- program type check
checkProgType (Program stm) = checkStmType stm

-- statement type checks
checkStmType (SAss x e) = do
    etype <- checkExpType e
    st <- get
    case st x of Right etype -> return ()
                 Left () -> throwE "use of undeclared variable"
                 _ -> throwE "type mismatch in assignment"

-- statement type checks
checkExpType (EAdd e1 e2) = do
    t1 <- checkExpType e1
    t2 <- checkExpType e2
    case (t1, t2) of (ExpInt, ExpInt) -> return ExpInt
                     _ -> throwE "type mismatch in addition"

-- declaration type checks
checkDeclType _ = return ()
