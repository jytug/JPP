-- local imports
import TypeChecker
import ParLang
import LexLang

-- global imports
import System.Environment
import System.IO

parser = pProg . myLexer

usageError :: IO ()
usageError = do
    putStrLn "usage: ./main <program file>"

main :: IO ()
main = do
    files <- getArgs
    case files of
        [] -> usageError
        file:_ -> do
            program <- readFile file
            putStrLn . show $ parser program
