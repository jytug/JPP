sum1 :: (Integral a) => [a] -> a
sum1 = foldr (+) 0

sum2 :: (Integral a) => [a] -> a
sum2 [] = 0
sum2 (x:xs) = x + sum2 xs

sum3rec :: (Integral a) => a -> [a] -> a
sum3rec a [] = a
sum3rec a (x:xs) = x + sum3rec a xs

sum3 :: (Integral a) => [a] -> a
sum3 = sum3rec 0
