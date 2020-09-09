module PSPS.Design.Module.Trans.Alt (kind Hello, Hello, World) where

import PSPS (kind Expr)

foreign import kind Hello

foreign import kind Goodbye

foreign import data Hello :: Hello

foreign import data World :: Hello

foreign import data See :: Goodbye

foreign import data You :: Goodbye

-- ie if we had data Goodbye = See | You | Test Int Int
foreign import data Test :: Expr -> Expr -> Goodbye

foreign import data GoodbyeExpr0 :: Goodbye -> Expr

foreign import data GoodbyeExpr1 :: (Expr -> Goodbye) -> Expr

foreign import data GoodbyeExpr2 :: (Expr -> Expr -> Goodbye) -> Expr

type GoodbyeBinary
  = GoodbyeExpr2 Test

-- can have curried types
type GoodbyeUnary
  = GoodbyeExpr1 (Test (GoodbyeExpr0 See))
