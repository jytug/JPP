module Auto(Auto, accepts, emptyA, epsA, symA,
            leftA, sumA, thenA, fromLists, toLists) where
import Data.List

-- magic helpers
comp :: (c -> d) -> (a -> b -> c) -> (a -> b -> d)
comp = (.) . (.)

allValues :: (Bounded a, Enum a) => [a]
allValues = [minBound..]

fst3 :: (a,b,c) -> a
fst3 (x, _, _) = x

snd3 :: (a,b,c) -> b
snd3 (_, y, _) = y

trd3 :: (a,b,c) -> c
trd3 (_, _, z) = z

data Auto a q = A { states      :: [q]
                  , initStates  :: [q]
                  , isAccepting :: q -> Bool
                  , transition  :: q -> a -> [q]
                  }

instance (Show a, Enum a, Bounded a, Show q) => Show (Auto a q) where
    show aut = "fromLists " ++ (show $ toLists aut)

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
-- language as <auto>, but its type is
-- Either q r, where q is the type of states
-- of the former automaton
leftA :: Auto a q -> Auto a (Either q r)
leftA aut = A { states = map Left $ states aut
              , initStates = map Left $ initStates aut
              , isAccepting = either (isAccepting aut) (const False)
              , transition = either leftTransition rightTransition
              }
              where leftTransition = (map Left) `comp` (transition aut)
                    rightTransition = const $ const []

-- an automaton that recognizes the sum of languages
-- recognized by aut1 and aut2
sumA :: Auto a q1 -> Auto a q2 -> Auto a (Either q1 q2)
sumA aut1 aut2 = A { states = (map Left $ states aut1) ++ (map Right $ states aut2)
                   , initStates = (map Left $ initStates aut1) ++ (map Right $ initStates aut2)
                   , isAccepting = either (isAccepting aut1) (isAccepting aut2)
                   , transition = either leftTransition rightTransition
                   }
                   where leftTransition = map Left `comp` transition aut1
                         rightTransition = map Right `comp` transition aut2

-- if <aut1> recognizes the languages L1, and
-- <aut2> - the language L2, then thenA aut1 aut2
-- recognizes L1 || L2 (concatenation)
thenA :: Auto a q1 -> Auto a q2 -> Auto a (Either q1 q2)
thenA aut1 aut2 = A { states = (map Left $ states aut1) ++
                               (map Right $ states aut2)
                    , initStates = (map Left $ initStates aut1) ++
                                   if any (isAccepting aut1) (initStates aut1)
                                       then (map Right $ initStates aut2)
                                       else []
                    , isAccepting = either (const False) (isAccepting aut2)
                    , transition = either leftTransition rightTransition
                    }
                    where leftTransition st l =
                             if any (isAccepting aut1) ((transition aut1) st l)
                                then (map Left $ (transition aut1) st l) ++ 
                                     (map Right $ initStates aut2)
                                else map Left $ (transition aut1) st l
                          rightTransition = map Right `comp` transition aut2

-- Creates an automaton from a list [states, initStates, accepting, transitions]
-- if a list contains two or more transition tuples with same
-- state and character, all are taken into account
fromLists :: (Eq q, Eq a) => [q] -> [q] -> [q] -> [(q, a, [q])] -> Auto a q
fromLists states initStates accepting transition =
    A { states = states
      , initStates = initStates
      , isAccepting = flip elem accepting
      , transition = allTransitions
      }
      where allTransitions st l =
                concat [trd3 x | x <- transition, fst3 x == st && snd3 x == l]

-- Returns a list representation of an automaton
toLists :: (Enum a, Bounded a) => Auto a q -> ([q], [q], [q], [(q, a, [q])])
toLists aut = (st, init, acc, transit)
    where st = states aut
          init = initStates aut
          acc = [st | st <- states aut, (isAccepting aut) st]
          transit = [(st, l, tr) |
                     st <- states aut, l <- allValues,
                     let tr = (transition aut) st l,
                     not $ null tr]
