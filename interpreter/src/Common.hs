-- common monads, types and functions
-- for TypeChecker, Interpreter and Main

module Common where

import Control.Monad.State
import Control.Monad.Except

import System.IO

type ExceptStateM s m a = ExceptT String (StateT s m) a

pushState :: [a] -> [a]
pushState (s:ss) = s:s:ss

popState :: [a] -> [a]
popState (s:ss) = ss

applyFst :: (a -> a1) -> (a, b, c, d) -> (a1, b, c, d)
applyFst f (x, y, z, t) = (f x, y, z, t)

fst4 (x, _, _, _) = x
snd4 (_, x, _, _) = x
trd4 (_, _, x, _) = x
frth4 (_, _, _, x) = x

putError :: String -> IO ()
putError = hPutStrLn stderr
