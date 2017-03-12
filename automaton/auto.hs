import Data.List

data Auto a q = A { states      :: [q]
                  , initStates  :: [q]
                  , isAccepting :: q -> Bool
                  , transition  :: q -> a -> [q]
                  }

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

-- an empty automaton
emptyA :: Auto a ()
emptyA = A { states = []
           , initStates = []
           , isAccepting = const False
           , transition = curry $ const []
           }

-- an automaton that recognizes just the empty word
epsA :: Auto a ()
epsA = A { states = [()]
         , initStates = [()]
         , isAccepting = (const True)
         , transition = curry $ const []
         }

-- an automaton that recognizes one word
symA :: Eq a => a -> Auto a Bool
symA c = A { states = [True, False]
           , initStates = [False]
           , isAccepting = id
           , transition = (\st l -> if not st && l == c then [True] else [])
           }

-- gives an automaton that recognizes the same
-- language as <auto>, but which's type is
-- Either q r, where q is the type of states
-- of the former automaton
leftA :: Auto a q -> Auto a (Either q r)
leftA aut = A { states = map Left $ states aut
              , initStates = map Left $ initStates aut
              , isAccepting = either (isAccepting aut) (const False)
              , transition = either (\st l -> map Left $ (transition aut st l)) (const $ const [])
              }

-- an automaton that recognizes languages
-- that are recognized by both aut1 and aut2
sumA :: Auto a q1 -> Auto a q2 -> Auto a (Either q1 q2)
sumA aut1 aut2 = A { states = concat [(map Left $ states aut1) (map Right $ states aut2)]
                   , initStates = concat
                       [(map Left $ initStates aut1) (map Right $ initStates aut2)]
                   , isAccepting = (map Left . isAccepting aut1) (map Right .isAccepting aut2)
                   , transition = either (transition aut1) (transition aut2)
                   }
