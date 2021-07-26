add' :: Int -> Int -> Int
add' = (\x -> (\y -> x+y))
-- or
-- add' x y = x+y
-- add' x = (\y -> x+y)
-- add' = (\x -> (\y -> x+y))


