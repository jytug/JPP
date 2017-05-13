-- common monads, types and functions
-- for TypeChecker, Interpreter and Main

module Common where

import Control.Monad.State
import Control.Monad.Except

type ExceptStateM s m a = ExceptT String (StateT s m) a

pushState :: [a] -> [a]
pushState (s:ss) = s:s:ss

popState :: [a] -> [a]
popState (s:ss) = ss

fst4 (x, _, _, _) = x
snd4 (_, x, _, _) = x
trd4 (_, _, x, _) = x
frth4 (_, _, _, x) = x
