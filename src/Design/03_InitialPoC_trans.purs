module PSPS.Design.Module.Trans where

import PSPS (kind Expr, kind Result)

foreign import kind MaybeE

foreign import kind MaybeR

foreign import data JustE :: Expr -> MaybeE

foreign import data NothingE :: MaybeE

foreign import data JustR :: Result -> MaybeR

foreign import data NothingR :: MaybeR

foreign import data MaybeE0 :: MaybeE -> Expr

foreign import data MaybeE1 :: (Expr -> MaybeE) -> Expr

foreign import data MaybeR0 :: MaybeR -> Result

foreign import data MaybeR1 :: (Result -> MaybeR) -> Result

foreign import kind TupleE

foreign import kind TupleR

foreign import data TupleE :: Expr -> Expr -> TupleE

foreign import data TupleR :: Result -> Result -> TupleR

foreign import data TupleE0 :: TupleE -> Expr

foreign import data TupleE1 :: (Expr -> TupleE) -> Expr

foreign import data TupleE2 :: (Expr -> Expr -> TupleE) -> Expr

foreign import data TupleR0 :: TupleR -> Result

foreign import data TupleR1 :: (Result -> TupleR) -> Result

foreign import data TupleR2 :: (Result -> Result -> TupleR) -> Result
