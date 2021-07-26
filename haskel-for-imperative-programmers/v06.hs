app :: (a -> b) -> a -> b
app f x = f x

add1 :: Int -> Int
add1 x = x+1

-- anonymous function
-- app (\x -> x+1) 1
--
-- map
-- map (\x -> x+1) [1,2,3,4,5]
-- map (\(x,y) -> x+y) [(1,2),(2,3),(3,4)]
--
-- filter
-- filter (\x -> x > 2) [1,2,3,4,5]
-- filter (\(x,y) -> x /= y) [(1,2),(2,2)]
