import Control.Monad
import Data.List
import Data.Maybe
import System.Environment
import System.IO
import Text.Read
import Auto

-- some helpers
parseIntsMaybe :: [String] -> Maybe [Integer]
parseIntsMaybe = sequence . (map readMaybe)

isUpperAlpha :: Char -> Bool
isUpperAlpha c = (c <= 'Z') && (c >= 'A')

readNumStates :: String -> Maybe Integer
readNumStates line = readMaybe line :: Maybe Integer

readStateList :: String -> Maybe [Integer]
readStateList line = readMaybe line :: Maybe [Integer]

readTransitions :: [String] -> Maybe [(Integer, Char, [Integer])]
readTransitions [] = Just []
readTransitions (trans:rest) = do
    guard $ toInteger (length allWords) >= 3
    guard $ all isUpperAlpha chars
    src <- readMaybe srcWord :: Maybe Integer
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
    guard (all isUpperAlpha word)
    numStates <- readNumStates numStatesLine
    initStates <- readStateList initStatesLine
    acceptingStates <- readStateList acceptingStatesLine
    transitions <- readTransitions transitionsLines
    let states = nub (initStates ++
                      acceptingStates ++
                      concat [src:dsts | (src, _, dsts) <- transitions])
    guard (toInteger (length states) <= numStates)
    guard (all (>=0) states)
    let auto = fromLists states initStates acceptingStates transitions
    return $ accepts auto word
    where allLines = filter (not . null) $ lines contents
          numStatesLine = head allLines
          initStatesLine = head $ drop 1 allLines
          acceptingStatesLine = head $ drop 2 allLines
          transitionsLines = drop 3 $ init allLines
          word = last allLines

runAuto :: String -> String
runAuto contents = case parseAutoFile contents of
    Just b    -> show b
    Nothing   -> "BAD INPUT"

main = do
    (file:_) <- getArgs
    contents <- readFile file
    putStrLn $ runAuto contents
