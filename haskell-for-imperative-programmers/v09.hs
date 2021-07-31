-- Folding
--
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr (+) 0 [1,2..50]
-- it means 1 + 2 + 3 + ... + 50 + 0
--
-- sum = foldr (+) 0
-- and = foldr (&&) True
-- or = foldr (||) True
--
count' e = foldr (\x acc -> if e==x then acc+1 else acc) 0
isAll e = foldr (\x -> (&&) $ e==x) True
-- isAll e = foldr (\x acc -> e==x && acc) True
-- length = foldr (\x -> (+) 1) 0
-- length = foldr (const $ (+) 1) 0
-- map f = foldr ((:) . f) []

-- foldr (\elem acc -> <term>) <start_acc> <list>
-- foldl (\acc elem -> <term>) <start_acc> <list>

-- Folding (Tree)
--
--
