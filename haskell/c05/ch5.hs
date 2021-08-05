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
-- a fold takes a binary function, a starting value, and a list
-- to fold up.
--

-- left folds with foldl
--
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs
-- sum' :: (Num a) => [a] -> a
-- sum' = foldl (+) 0

-- right folds with foldr
--
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs
-- If we’re mapping (+3) to [1,2,3] , we approach the list from the right
-- side. We take the last element, which is 3 , and apply the function to it, which
-- gives 6 . Then we prepend it to the accumulator, which was [] . 6:[] is [6]

-- map' :: (a -> b) -> [a] -> [b]
-- map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- One big difference between the two types of folds is that right folds work
-- on infinite lists, whereas left ones don’t!

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys

-- the fold and foldr 1 functions
-- They assume the first (or last) element of 
-- the list to be the starting accumulator,
-- and then start the fold with the element next to it.

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

-- Because they depend on the lists they’re called with having at least one
-- element, these functions cause runtime errors if called with empty lists. 
-- foldl and foldr , on the other hand, work fine with empty lists.
--

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []
-- reverse' :: [a] -> [a]
-- reverse' = foldl (flip (:)) []

product' :: (Num a) => [a] -> a
product' = foldl (*) 1

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- another way to look at folds
--
-- when we right fold over the list [3,4,5,6],
-- we're essentially doing this:
-- f 3 (f 4 (f 5 (f 6 z)))
--
-- doing left fold over that list with g as the binary
-- function and z as the accumulator is the equivalent of this:
-- g (g (g (g z 3) 4) 5) 6
-- flip (:) (flip (:) (flip (:) (flip (:) [] 3) 4) 5) 6

and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

-- Scans
--
-- the scanl and scanr functions are like foldl and foldr,
-- except they report all the intermediate accumulator states
-- in the form of a list.
-- the scanl1 and scanr1 functions are analogous to foldl1 and foldr1
--
-- scanl (+) 0 [3,5,2,1]
-- scanr (+) 0 [3,5,2,1]
-- scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]

-- how many elements does it take for the sum of the square 
-- roots of all natural numbers to exceed 1000 ?
sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

-- Function application with $
--
-- ($) :: (a -> b) -> a -> b
-- f $ x = f x
--
-- hereas normal function application
-- (putting a space between two things) has a really high
-- precedence, the $ function has the lowest precedence
--
-- sum (filter (> 10) (map (*2) [2..10]))
-- sum $ filter (> 10) $ map (*2) [2..10]

-- The $ function is right-associative, meaning that something like f $ g $ x
-- is equivalent to f $ (g $ x) .
--
-- map ($ 3) [(4+), (10*), (^2), sqrt]


-- function composition
--
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g = \x -> f (g x)
--
-- One use for function composition is
-- making functions on the fly to pass to other
-- functions.

-- map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,19,24]
-- 
-- alternative:
--
-- map (negate . abs) [5,-3,-6,7,-3,2,19,24]

-- function composition is right-associative
-- f (g (z x)) is equivalent to (f . g . z) x

-- map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
-- alternative:
--
-- map (negate . sum . tail) [[1..5],[3..6],[1..7]]

-- Function composition with multiple parameters
--
-- sum (replicate 5 (max 6.7 8.9))
-- (sum . replicate 5) max 6.7 8.9
-- sum replicate 5 $ max 6.7 8.9
--
-- replicate 2 (product (map (*3) (zipWith max [1,2] [4,5])))
-- replicate 2 . product . map (*3) $ zipWith max [1,2] [4,5]
--

-- Point-free style
--
-- another common use of function composition is defining functions 
-- in the point-free style
--
-- sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (+) 0 xs
--
-- because of currying, we can omit the xs on both sides,
-- since calling foldl (+) 0 creates a function that takes
-- a list
--
-- sum' :: (Num a) => [a] -> a
-- sum' = foldl (+) 0
-- 
-- example:
-- fn x = ceiling (negate (tan (cos (max 50 x))))
--
-- fn = ceiling . negate . tan . cos . max 50
--
-- oddSquareSum :: Integer
-- oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
--
-- oddSquareSum :: Integer
-- oddSquareSum = sum . takeWhile (<10000) . filter odd $ map (^2) [1..]




