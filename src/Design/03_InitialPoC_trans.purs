module PSPS.Design.Module.Trans where

import PSPS (kind Expr)

foreign import kind Maybe

foreign import data Just :: Expr -> Maybe

foreign import data Nothing :: Maybe

foreign import data Maybe0 :: Maybe -> Expr

foreign import data Maybe1 :: (Expr -> Maybe) -> Expr

foreign import kind Tuple

foreign import data Tuple :: Expr -> Expr -> Tuple

foreign import data Tuple0 :: Tuple -> Expr

foreign import data Tuple1 :: (Expr -> Tuple) -> Expr

foreign import data Tuple2 :: (Expr -> Expr -> Tuple) -> Expr
