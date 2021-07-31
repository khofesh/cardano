-- Records
--
data Person = Person {name :: String,
                      age :: Int }
greet :: Person -> [Char]
greet person = "Hi " ++ name person
-- greet $ Person "Fahmi" 23
--
-- greet :: Person -> [Char]
-- greet (Person name _) = "Hi " ++ name
--
-- the order of the argument is important

data Point = 
   D2 {x :: Int, y :: Int}
 | D3 {x :: Int, y :: Int, z :: Int}
-- x (D2 1 2)
-- => 1
--
-- x (D3 1 2 3)
-- => 1
--
-- z (D2 1 2)
-- ==> Error, because z only works on D3 and not D2

