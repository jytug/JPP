import Data.List

data Auto a q = A { states      :: [q]
                  , initStates  :: [q]
                  , isAccepting :: q -> Bool
                  , transition  :: q -> a -> [q]
                  }

-- symA :: Eq a => a -> Auto a Bool
-- leftA :: Auto a q -> Auto a (Either q r)
-- sumA :: Auto a q1 -> Auto a q2 -> Auto a (Either q1 q2)
-- thenA :: Auto a q1 -> Auto a q2 -> Auto a (Either q1 q2)
-- fromLists :: (Eq q, Eq a) => [q] -> [q] -> [q] -> [(q, a, [a])] -> Auto a q
-- toLists :: (Enum a, Bounded a) => Auto a q -> ([q], [q], [q], [(q, a, [q])])

acceptsAcc :: Eq q => Auto a q -> [a] -> [q] -> Bool
acceptsAcc aut [] acc = any (isAccepting aut) acc
acceptsAcc aut (w:ws) states = acceptsAcc aut ws newStates
    where newStates = nub $ concat $ map ((flip $ transition aut) w) states

-- tells whether the automaton aut accepts the word w
accepts :: Eq q => Auto a q -> [a] -> Bool
accepts aut w = acceptsAcc aut w (initStates aut)

-- gives an empty automaton
emptyA :: Auto a ()
emptyA = A { states = []
           , initStates = []
           , isAccepting = const False
           , transition = curry $ const []
           }

-- gives an automaton that recognizes just the empty word
epsA :: Auto a ()
epsA = A { states = [()]
         , initStates = [()]
         , isAccepting = (const True)
         , transition = curry $ const []
         }

symA :: Eq a => a -> Auto a Bool
symA c = A { states = [True, False]
           , initStates = [False]
           , isAccepting = id
           , transition = (\st l -> if not st && l == c then [True] else [])
           }
