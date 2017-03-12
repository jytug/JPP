compose :: Int -> (a -> a) -> (a -> a)
compose n f
    | n < 0         = error "can't invert functions yet"
    | n == 0        = id
    | otherwise     = f . compose (n-1) f

compose2 :: Int -> (a -> a) -> (a -> a)
compose2 n f = foldl (.) id $ (replicate n f)
