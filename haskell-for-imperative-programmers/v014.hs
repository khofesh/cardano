-- Maybe
--
-- data Maybe a = Nothing | Just a

safeDiv :: Integral a => a -> a -> Maybe a
safeDiv a b =
  if b == 0 then Nothing else Just $ div a b

-- import Data.Maybe
--
-- isJust :: Maybe a -> Bool
-- isNothing :: Maybe a -> Bool
-- fromJust :: Maybe a -> a
--
-- fromMaybe :: a -> Maybe a ->
--
-- fromMaybe 3.1415 (Nothing)
-- => 3.1415
--
-- fromMaybe 3.1415 (Just 2.7183)
-- => 2.7183
