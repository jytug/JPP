-- common monads, types and functions
-- for TypeChecker, Interpreter and Main

module Common where

import Control.Monad.Trans.State
import Control.Monad.Trans.Except

type ExceptStateM s m a = ExceptT String (StateT s m) a
