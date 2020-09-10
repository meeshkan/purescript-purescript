module PSPS.Design.InitialPoC.Trans where

import PSPS (class Bind, class Eval, Abs, kind Expr, kind ModuleName)

foreign import data PSPS_Design_InitialPoC_Trans :: ModuleName

class PSPS_Design_InitialPoC_Trans_Eval (expr :: Expr) (result :: Expr) | expr -> result

class PSPS_Design_InitialPoC_Trans_Bind (path :: Symbol) (expr :: Expr) | path -> expr

foreign import kind Maybe

foreign import data Just :: Expr -> Maybe

foreign import data Nothing :: Maybe

foreign import data Maybe0 :: Maybe -> Expr

foreign import data Maybe1 :: (Expr -> Maybe) -> Expr

instance iPSPS_Design_InitialPoC_Trans_Bind'Just :: PSPS_Design_InitialPoC_Trans_Bind "Just" (Maybe1 Just)

instance iPSPS_Design_InitialPoC_Trans_Bind'Nothing :: PSPS_Design_InitialPoC_Trans_Bind "Nothing" (Maybe0 Nothing)

instance iBind'Just :: PSPS_Design_InitialPoC_Trans_Bind "Just" o => Bind PSPS_Design_InitialPoC_Trans "Just" o

instance iBind'Nothing :: PSPS_Design_InitialPoC_Trans_Bind "Nothing" o => Bind PSPS_Design_InitialPoC_Trans "Nothing" o

instance iPSPS_Design_InitialPoC_Trans_Eval'Just'Maybe0 ::
  PSPS_Design_InitialPoC_Trans_Eval v0 v0' =>
  PSPS_Design_InitialPoC_Trans_Eval (Maybe0 (Just v0)) (Maybe0 (Just v0'))

instance iPSPS_Design_InitialPoC_Trans_Eval'Nothing'Maybe0 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe0 Nothing) (Maybe0 Nothing)

instance iPSPS_Design_InitialPoC_Trans_Eval'Just'Maybe1 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe1 Just) (Maybe1 Just)

instance iPSPS_Design_InitialPoC_Trans_Eval'Just'Maybe1'Abs ::
  PSPS_Design_InitialPoC_Trans_Eval a a' =>
  PSPS_Design_InitialPoC_Trans_Eval (Abs (Maybe1 Just) a) (Maybe0 (Just a'))

instance iEval'Just'Maybe0 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe0 (Just v0)) o =>
  Eval (Maybe0 (Just v0)) o

instance iEval'Nothing'Maybe0 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe0 Nothing) o =>
  Eval (Maybe0 Nothing) o

instance iEval'Just'Maybe1 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe1 Just) o =>
  Eval (Maybe1 Just) o

foreign import kind Tuple

foreign import data Tuple :: Expr -> Expr -> Tuple

foreign import data Tuple0 :: Tuple -> Expr

foreign import data Tuple1 :: (Expr -> Tuple) -> Expr

foreign import data Tuple2 :: (Expr -> Expr -> Tuple) -> Expr

instance iPSPS_Design_InitialPoC_Trans_Eval'Tuple'Tuple0 ::
  (PSPS_Design_InitialPoC_Trans_Eval v0 v0', PSPS_Design_InitialPoC_Trans_Eval v1 v1') =>
  PSPS_Design_InitialPoC_Trans_Eval (Tuple0 (Tuple v0 v1)) (Tuple0 (Tuple v0' v1'))

instance iPSPS_Design_InitialPoC_Trans_Eval'Tuple'Tuple1 ::
  (PSPS_Design_InitialPoC_Trans_Eval v0 v0') =>
  PSPS_Design_InitialPoC_Trans_Eval (Tuple1 (Tuple v0)) (Tuple1 (Tuple v0'))

instance iPSPS_Design_InitialPoC_Trans_Eval'Tuple'Tuple2 ::
  PSPS_Design_InitialPoC_Trans_Eval (Tuple2 Tuple) (Tuple2 Tuple)

instance iEval'Tuple'Tuple0 ::
  PSPS_Design_InitialPoC_Trans_Eval (Tuple0 (Tuple v0 v1)) o =>
  Eval (Tuple0 (Tuple v0 v1)) o

instance iEval'Tuple'Tuple1 ::
  PSPS_Design_InitialPoC_Trans_Eval (Tuple1 (Tuple v0)) o =>
  Eval (Tuple1 (Tuple v0)) o

instance iEval'Tuple'Tuple2 ::
  PSPS_Design_InitialPoC_Trans_Eval (Tuple2 Tuple) o =>
  Eval (Tuple2 Tuple) o

instance iPSPS_Design_InitialPoC_Trans_Eval'Just'Tuple2'Abs ::
  PSPS_Design_InitialPoC_Trans_Eval a a' =>
  PSPS_Design_InitialPoC_Trans_Eval (Abs (Tuple2 Tuple) a) (Tuple1 (Tuple a'))

instance iPSPS_Design_InitialPoC_Trans_Eval'Just'Tuple1'Abs ::
  (PSPS_Design_InitialPoC_Trans_Eval a a', PSPS_Design_InitialPoC_Trans_Eval b b') =>
  PSPS_Design_InitialPoC_Trans_Eval (Abs (Tuple1 (Tuple a)) b) (Tuple0 (Tuple a' b'))

instance iPSPS_Design_InitialPoC_Trans_Bind'Tuple :: PSPS_Design_InitialPoC_Trans_Bind "Tuple" (Tuple2 Tuple)

instance iBind'Tuple :: PSPS_Design_InitialPoC_Trans_Bind "Tuple" o => Bind PSPS_Design_InitialPoC_Trans "Tuple" o
