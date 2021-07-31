import Data.List

-- create ascending list from n to m
asc :: Int -> Int -> [Int]
asc n m
 | m < n = []
 | m == n = [m]
 | m > n = n : asc (n+1) m

evens :: [Int] -> [Int]
evens []        = []
evens (x:xs)
 | mod x 2 == 0 = x : evens xs
 | otherwise    = evens xs

addTuples :: [(Int, Int)] -> [Int]
addTuples xs = [x+y | (x, y) <- xs]
