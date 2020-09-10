module PSPS.Design.InitialPoC.Trans where

import PSPS (kind Expr, class Eval)

class PSPS_Design_InitialPoC_Trans_Eval (expr :: Expr) (result :: Expr) | expr -> result

foreign import kind Maybe

foreign import data Just :: Expr -> Maybe

foreign import data Nothing :: Maybe

foreign import data Maybe0 :: Maybe -> Expr

foreign import data Maybe1 :: (Expr -> Maybe) -> Expr

instance iPSPS_Design_InitialPoC_Trans_Eval'Just'Maybe0 ::
  Eval v0 v0' =>
  PSPS_Design_InitialPoC_Trans_Eval (Maybe0 (Just v0)) (Maybe0 (Just v0'))

instance iPSPS_Design_InitialPoC_Trans_Eval'Nothing'Maybe0 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe0 Nothing) (Maybe0 Nothing)

instance iPSPS_Design_InitialPoC_Trans_Eval'Just'Maybe1 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe1 Just) (Maybe1 Just)

foreign import kind Tuple

foreign import data Tuple :: Expr -> Expr -> Tuple

foreign import data Tuple0 :: Tuple -> Expr

foreign import data Tuple1 :: (Expr -> Tuple) -> Expr

foreign import data Tuple2 :: (Expr -> Expr -> Tuple) -> Expr

instance iPSPS_Design_InitialPoC_Trans_Eval'Tuple'Tuple0 ::
  (Eval v0 v0', Eval v1 v1') =>
  PSPS_Design_InitialPoC_Trans_Eval (Tuple0 (Tuple v0 v1)) (Tuple0 (Tuple v0' v1'))

instance iPSPS_Design_InitialPoC_Trans_Eval'Tuple'Tuple1 ::
  (Eval v0 v0') =>
  PSPS_Design_InitialPoC_Trans_Eval (Tuple1 (Tuple v0)) (Tuple1 (Tuple v0'))

instance iPSPS_Design_InitialPoC_Trans_Eval'Tuple'Tuple2 ::
  PSPS_Design_InitialPoC_Trans_Eval (Tuple2 Tuple) (Tuple2 Tuple)
