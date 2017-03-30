import Control.Applicative
import Control.Monad
import Control.Monad.Writer
import Control.Monad.State
import Data.Functor.Identity

newtype This a = That a

instance Functor This where
    fmap = liftM

instance Applicative This where
    pure = return
    (<*>) = ap

instance Monad This where
    (>>=) (That v) cont = cont v
    return v = That v

data Tree a = Node (Tree a) a (Tree a) | Leaf

toList :: Tree a -> [a]
toListRec :: Tree a -> [a] -> (This [a])

toList t = let (That l) = toListRec t [] in l
toListRec Leaf l = That l
toListRec (Node tl a tr) l = do {
    l1 <- toListRec tr l;
    l2 <- That (a:l1);
    l3 <- toListRec tl l2;
    return l3
}

instance Functor Maybe' where
    fmap = liftM

instance Applicative Maybe' where
    pure = return
    (<*>) = ap

data Maybe' a = Just' a | Err' String deriving (Show)
instance Monad Maybe' where
    (>>=) (Just' v) f = f v
    (>>=) (Err' err) f = Err' ("inner " ++ err)
    return v = Just' v

data Exp = EAdd Exp Exp | EDiv Exp Exp | EInt Int deriving (Show)

eval :: Exp -> (Maybe' Int)
eval (EInt n) = return n
eval (EAdd exp1 exp2) = do
    x1 <- eval exp1
    x2 <- eval exp2
    return (x1 + x2)

eval (EDiv exp1 exp2) = do
    x1 <- eval exp1
    x2 <- eval exp2
    if (x2 == 0) then Err' "division by 0" else return (x1 `quot` x2)


exists :: (Ord a) => a -> Tree a -> (Writer [a] Bool)
exists _ Leaf = return False
exists x (Node lt v rt) = do
    tell [v]
    if x == v then
        return True
    else
        if x < v then
            exists x lt
        else
            exists x rt

exTree :: Tree Int
exTree = Node (Node Leaf 1 Leaf) 3 (Node Leaf 5 Leaf)

sumTree :: (Tree Int) -> ((WriterT String (StateT Int Identity)) ())
sumTree Leaf = return ()
sumTree (Node tl a tr) = do
    sumTree tl
    modify (+a)
    sumTree tr

runSum = runIdentity (runStateT (runWriterT (sumTree exTree)) 0)
