-- local imports
import TypeChecker
import Interpreter

import Common

import AbsLang
import ParLang
import LexLang
import ErrM

-- global imports
import System.Environment
import System.IO

parser = pProg . myLexer

usageError :: IO ()
usageError = do
    putError "usage: ./interpreter <program file>"

run :: Prog -> IO ()
run program = do
    case typeProg program of
        (Right _)    -> do
            result <- runProg program
            case result of
                Left error -> putError $ "interpreter error: " ++ error
                otherwise  -> return ()
                
        (Left error) -> putError $ "type error: " ++ error

main :: IO ()
main = do
    files <- getArgs
    case files of
        [] -> usageError
        file:_ -> do
            program <- readFile file
            case parser program of
                Ok prog   -> run prog
                Bad error -> putError error
