import Control.Monad
import Data.List
import Data.Maybe
import System.Environment
import System.IO
import Text.Read
import Auto

-- some helpers
parseIntsMaybe :: [String] -> Maybe [Int]
parseIntsMaybe l = if any isNothing parsed then Nothing
                   else Just $ catMaybes parsed
                   where parsed = parseInts l
                         parseInts l = map readMaybe l :: [Maybe Int]

readNumStates :: String -> Maybe Int
readNumStates line = readMaybe line :: Maybe Int

readStateList :: String -> Maybe [Int]
readStateList line = readMaybe line :: Maybe [Int]

readTransitions :: [String] -> Maybe [(Int, Char, [Int])]
readTransitions [] = Just []
readTransitions (trans:rest) = do
    guard (length allWords >= 3)
    src <- readMaybe srcWord :: Maybe Int
    dsts <- parseIntsMaybe dstsWords
    restResult <- readTransitions rest
    return $ [(src, c, dsts) | c <- chars] ++ restResult 
    where allWords = words trans
          srcWord = head allWords
          chars = head $ drop 1 allWords
          dstsWords = drop 2 allWords
     

parseAutoFile :: String -> Maybe Bool
parseAutoFile contents = do
    guard (length allLines >= 4)
    numStates <- readNumStates numStatesLine
    initStates <- readStateList initStatesLine
    acceptingStates <- readStateList acceptingStatesLine
    transitions <- readTransitions transitionsLines
    let states = nub (initStates ++
                      acceptingStates ++
                      concat [src:dsts | (src, _, dsts) <- transitions])
    guard (length states >= numStates)
    let auto = fromLists [1..numStates] initStates acceptingStates transitions
    return $ accepts auto word
    where allLines = filter (not . null) $ lines contents
          numStatesLine = head allLines
          initStatesLine = head $ drop 1 allLines
          acceptingStatesLine = head $ drop 2 allLines
          transitionsLines = drop 3 $ init allLines
          word = last allLines
          --auto = fromLists [1..numStates] initStates acceptingStates transitions

runAuto :: String -> String
runAuto contents = case parseAutoFile contents of
    Just b    -> show b
    Nothing   -> "Bad input"

main = do
    (file:_) <- getArgs
    contents <- readFile file
    putStrLn $ runAuto contents
