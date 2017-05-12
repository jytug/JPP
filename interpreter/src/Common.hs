-- common monads, types and functions
-- for TypeChecker, Interpreter and Main

module Common where

import Control.Monad.State
import Control.Monad.Except

type ExceptStateM s m a = ExceptT String (StateT s m) a
