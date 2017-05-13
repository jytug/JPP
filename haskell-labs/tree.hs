import Control.Monad.State

data Tree a
        = Leaf
        | Branch (Tree a) a (Tree a)
    deriving (Show, Eq, Read)

exTree :: Tree Int
exTree = Branch (Leaf) 1 (Branch Leaf 2 Leaf)

sumTree :: (Num a) => Tree a -> State a a
sumTree Leaf = return 0
sumTree (Branch tl x tr) = do
    modify (+x)
    sl <- sumTree tl
    sr <- sumTree tr
    return (sl + sr + x)
