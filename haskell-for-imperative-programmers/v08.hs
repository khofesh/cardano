-- descSort = reverse . sort
-- descSort = (\x -> reverse (sort x))
-- descSort x = reverse (sort x)

map2D :: (a -> b) -> [[a]] -> [[b]]
map2D = map . map
-- map2D = (\f1 xs -> map f1 xs) . (\f2 ys -> map f2 ys)
-- map2D = (\x -> (\f1 xs -> map f1 xs) ((\f2 ys -> map f2 ys) x))
-- map2D x = (\f1 xs -> map f1 xs) ((\f2 ys -> map f2 ys) x)
-- map2D x = (\f1 xs -> map f1 xs) (\ys -> map x ys)
-- map2D x = (\xs -> map (\ys -> map x ys) xs)
-- map2D f xs = map (\ys -> map f ys) xs

-- Dollar Sign
-- ($) :: (a -> b) -> a -> b
-- something xs = map (\x -> x+1) (filter (\x -> x>1) xs)
something xs = map (\x -> x+1) $ filter (\x -> x>1) xs


