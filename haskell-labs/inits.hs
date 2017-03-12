initsRec :: [a] -> [a] -> [[a]] -> [[a]]
initsRec [] cur full = full ++ [cur]
initsRec (x:xs) cur full = initsRec xs (cur ++ [x]) (full ++ [cur])

initsRec2 :: [a] -> [[a]] -> [[a]]
initsRec2 [] acc = acc ++ [[]]
initsRec2 (x:xs) [] = reverse $ initsRec2 xs [[x]]
initsRec2 (x:xs) (acc:accs) = 
    initsRec2 xs ((acc ++ [x]) : (acc : accs))

inits :: [a] -> [[a]]
inits x = initsRec x [] []

inits2 :: [a] -> [[a]]
inits2 x = initsRec2 x []

initsCool1 :: [a] -> [[a]]
initsCool1 l = map reverse (scanl (flip (:)) [] l)

initsCool2 :: [a] -> [[a]]
initsCool2 = scanl (\l x -> l ++ [x]) []

initsCool3 :: [a] -> [[a]]
initsCool3 l = zipWith take [0 .. length l] (repeat l)
