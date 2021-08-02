multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

compareWithHundred :: Int -> Ordering
compareWithHundred x = compare 100 x

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

subTractFour :: Int -> Int
subTractFour = (subtract 4)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)
-- applyTwice (+3) 10
-- applyTwice (++ " haha") "hey"
-- applyTwice (3:) [1]

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
-- zipWith' (+) [4,2,5,6] [2,6,2,3]
-- zipWith' max [6,3,2,1] [7,3,1,5]
-- zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]
-- zipWith' (*) (replicate 5 2) [1..]
-- zipWith' (zipWith' (*)) [[1,2,3],[3,5,6], [2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where g x y = f y x
-- flip' :: (a -> b -> c) -> (b -> a -> c)
-- flip' f y x = f x y

-- *Main> zip [1,2,3,4,5] "hello"
-- [(1,'h'),(2,'e'),(3,'l'),(4,'l'),(5,'o')]
-- *Main> flip' zip [1,2,3,4,5] "hello"
-- [('h',1),('e',2),('l',3),('l',4),('o',5)]
-- *Main> zipWith div [2,2..] [10,8,6,4,2]
-- [0,0,0,0,1]
-- *Main> zipWith (flip' div) [2,2..] [10,8,6,4,2]
-- [5,4,3,2,1]

-- the map function
-- map :: (a -> b) -> [a] -> [b]
-- map _ [] = []
-- map f (x:xs) = f x : map f xs
--
-- example:
-- map (+3) [1,5,3,1,6]
-- map (replicate 3) [3..6]

-- the filter function
-- filter :: (a -> Bool) -> [a] -> [a]
-- filter _ [] = []
-- filter p (x:xs)
--   | p x = x : filter p xs
--   | otherwise = filter p xs
--
-- example:
-- filter (>3) [1,5,3,2,1,6,4,3,2,1]
-- let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]

-- [x | x <- [1..20], x < 15, even x]

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerOrEqual = filter (<= x) xs
      larger = filter (> x) xs
  in quicksort smallerOrEqual ++ [x] ++ quicksort larger

-- find the largest number under 100K 
-- that's divisible by 3.829
largestDivisible :: Integer
largestDivisible = head (filter p [100000,99999..])
  where p x = x `mod` 3829 == 0

-- to get the first word of a string:
-- takeWhile (/=' ') "elephants know how to party"
--
-- find the sum of all odd squares that are less than 10,000
-- sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
-- sum (takeWhile (<10000) [m | m <- [n^2 | n <- [1..]], odd m])

-- collatz sequence
-- 1. start with any natural number
-- 2. if the number is 1, stop
-- 3. if the number is even, divide it by 2
-- 4. if the number is odd, multiply it by 3 and add 1
-- 5. repeat the algorithm with the resulting number
chain :: Integer -> [Integer]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2)
  | odd n = n:chain (n*3 + 1)
-- chain 10

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
  where isLong xs = length xs > 15

-- mapping functions with multiple parameters
-- let listOfFuns = map (*) [0..]
-- (listOfFuns !! 4) 5
--
-- Getting the element with the index 4 from our list returns a function
-- that’s equivalent to (4*) . Then we just apply 5 to that function, which is the
-- same as (4*) 5 , or just 4 * 5 .
--

-- Lambdas
--
numLongChains' :: Int
numLongChains' = length (filter (\xs -> length xs > 15) (map chain [1..100]))

-- map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]
--

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

addThree' :: Int -> Int -> Int -> Int
addThree' = \x -> \y -> \z -> x + y + z

flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f = \x y -> f y x

-- zipWith (flip (++)) ["love you", "love me"] ["i ", "you "]
-- map (flip subtract 20) [1,2,3,4]


-- I Fold You So
--
--
