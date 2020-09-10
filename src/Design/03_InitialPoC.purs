module PSPS.Design.InitialPoC (class Semiring, add, zero, mul, one) where

foreign import intAdd :: Int -> Int -> Int

foreign import intMul :: Int -> Int -> Int

class Semiring a where
  add :: a -> a -> a
  zero :: a
  mul :: a -> a -> a
  one :: a

instance semiringInt :: Semiring Int where
  add = intAdd
  zero = 0
  mul = intMul
  one = 1

data Tuple a b
  = Tuple a b

data Maybe a
  = Just a
  | Nothing

onePlusOne :: Int
onePlusOne = add one one

addMaybe :: Maybe Int -> Maybe Int -> Maybe Int
addMaybe (Just x) (Just y) = Just (add x y)

addMaybe _ _ = Nothing

maybeOnePlusOneJ :: Maybe Int
maybeOnePlusOneJ = addMaybe (Just 1) (Just 1)

maybeOnePlusOneN :: Maybe Int
maybeOnePlusOneN = addMaybe (Just 1) Nothing
