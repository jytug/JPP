-- local imports
import TypeChecker

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
    putStrLn "usage: ./Main <program file>"

checkType :: Prog -> IO ()
checkType program = do
    case typeProg program of
        (Right _)    -> putStrLn "program type checking went well"
        (Left error) -> putStrLn $ "type error: " ++ error

main :: IO ()
main = do
    files <- getArgs
    case files of
        [] -> usageError
        file:_ -> do
            program <- readFile file
            case parser program of
                Ok prog   -> checkType prog
                Bad error -> putStrLn error
