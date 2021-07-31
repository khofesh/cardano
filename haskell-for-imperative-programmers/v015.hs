-- IO
--
-- putStrLn "Hello World"
-- hw = putStrLn "Hello World"
--
--
greet :: IO ()
greet = do
  putStrLn "What is your name?"
  name <- getLine
  putStrLn ("Hello " ++ name ++ ".")

-- greet :: IO ()
-- greet = do
--   putStrLn "What is your name?"
--   name <- getLine
--   let uname = map toUpper name
--   putStrLn ("Hello " ++ uname ++ ".")


-- f :: IO a -> a
-- unsafePerformIO :: IO a -> a

main :: IO ()
main = do
  i <- getLine
  if i /= "quit" then do
    putStrLn ("Input: " ++ i)
    main
  else 
   return ()

count :: Int -> Int -> IO ()
count n m = do
  putStrLn (show n)
  if n < m then
    count (n+1) m
  else
    return ()
