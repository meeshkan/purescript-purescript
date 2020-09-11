module PSPS.Design.InitialPoC.Trans where

import FFI.PSPS.Design.InitialPoC.Trans (class FFI_PSPS_Design_InitialPoC_Trans_Eval, Foreign'intAdd, Foreign'intMul)
import PSPS (class Bind, class Eval, Abs, App, Foreign, kind Expr, kind ModuleName)
import Type.Data.Peano (Succ, Z)

foreign import data PSPS_Design_InitialPoC_Trans :: ModuleName

class PSPS_Design_InitialPoC_Trans_Eval (expr :: Expr) (result :: Expr) | expr -> result

class PSPS_Design_InitialPoC_Trans_Bind (path :: Symbol) (expr :: Expr) | path -> expr

instance iPSPS_Design_InitialPoC_Trans_Bind'intAdd :: PSPS_Design_InitialPoC_Trans_Bind "intAdd" (Abs "intAdd" (Succ Z) (Abs "intAdd" Z (Foreign Foreign'intAdd)))

instance iPSPS_Design_InitialPoC_Trans_Eval'intAdd'intAdd1'App ::
  PSPS_Design_InitialPoC_Trans_Eval a a' =>
  PSPS_Design_InitialPoC_Trans_Eval (App (Abs "intAdd" (Succ Z) (Abs "intAdd" Z (Foreign Foreign'intAdd))) a) (Abs "intAdd" Z (App (Foreign Foreign'intAdd) a'))

instance iPSPS_Design_InitialPoC_Trans_Eval'intAdd'intAdd0'App ::
  ( PSPS_Design_InitialPoC_Trans_Eval a a'
  , PSPS_Design_InitialPoC_Trans_Eval b b'
  ) =>
  PSPS_Design_InitialPoC_Trans_Eval (App (Abs "intAdd" Z (App (Foreign Foreign'intAdd) a)) b) (App (App (Foreign Foreign'intAdd) a') b')

instance iPSPS_Design_InitialPoC_Trans_Eval'intAdd'intAddE'App ::
  ( PSPS_Design_InitialPoC_Trans_Eval a a'
  , PSPS_Design_InitialPoC_Trans_Eval b b'
  , FFI_PSPS_Design_InitialPoC_Trans_Eval (App (App (Foreign Foreign'intAdd) a') b') c
  ) =>
  PSPS_Design_InitialPoC_Trans_Eval (App (App (Foreign Foreign'intAdd) a) b) c

instance iPSPS_Design_InitialPoC_Trans_Bind'intMul :: PSPS_Design_InitialPoC_Trans_Bind "intMul" (Abs "intMul" (Succ Z) (Abs "intMul" Z (Foreign Foreign'intMul)))

instance iPSPS_Design_InitialPoC_Trans_Eval'intMul'intMul1'App ::
  PSPS_Design_InitialPoC_Trans_Eval a a' =>
  PSPS_Design_InitialPoC_Trans_Eval (App (Abs "intMul" (Succ Z) (Abs "intMul" Z (Foreign Foreign'intMul))) a) (Abs "intMul" Z (App (Foreign Foreign'intMul) a'))

instance iPSPS_Design_InitialPoC_Trans_Eval'intMul'intMul0'App ::
  ( PSPS_Design_InitialPoC_Trans_Eval a a'
  , PSPS_Design_InitialPoC_Trans_Eval b b'
  ) =>
  PSPS_Design_InitialPoC_Trans_Eval (App (Abs "intMul" Z (App (Foreign Foreign'intMul) a)) b) (App (App (Foreign Foreign'intMul) a') b')

instance iPSPS_Design_InitialPoC_Trans_Eval'intMul'intMulE'App ::
  ( PSPS_Design_InitialPoC_Trans_Eval a a'
  , PSPS_Design_InitialPoC_Trans_Eval b b'
  , FFI_PSPS_Design_InitialPoC_Trans_Eval (App (App (Foreign Foreign'intMul) a') b') c
  ) =>
  PSPS_Design_InitialPoC_Trans_Eval (App (App (Foreign Foreign'intMul) a) b) c

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

instance iPSPS_Design_InitialPoC_Trans_Eval'Tuple'Tuple2'App ::
  PSPS_Design_InitialPoC_Trans_Eval a a' =>
  PSPS_Design_InitialPoC_Trans_Eval (App (Tuple2 Tuple) a) (Tuple1 (Tuple a'))

instance iPSPS_Design_InitialPoC_Trans_Eval'Tuple'Tuple1'App ::
  (PSPS_Design_InitialPoC_Trans_Eval a a', PSPS_Design_InitialPoC_Trans_Eval b b') =>
  PSPS_Design_InitialPoC_Trans_Eval (App (Tuple1 (Tuple a)) b) (Tuple0 (Tuple a' b'))

instance iPSPS_Design_InitialPoC_Trans_Bind'Tuple :: PSPS_Design_InitialPoC_Trans_Bind "Tuple" (Tuple2 Tuple)

instance iBind'Tuple :: PSPS_Design_InitialPoC_Trans_Bind "Tuple" o => Bind PSPS_Design_InitialPoC_Trans "Tuple" o

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

instance iPSPS_Design_InitialPoC_Trans_Eval'Just'Maybe1'App ::
  PSPS_Design_InitialPoC_Trans_Eval a a' =>
  PSPS_Design_InitialPoC_Trans_Eval (App (Maybe1 Just) a) (Maybe0 (Just a'))

instance iEval'Just'Maybe0 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe0 (Just v0)) o =>
  Eval (Maybe0 (Just v0)) o

instance iEval'Nothing'Maybe0 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe0 Nothing) o =>
  Eval (Maybe0 Nothing) o

instance iEval'Just'Maybe1 ::
  PSPS_Design_InitialPoC_Trans_Eval (Maybe1 Just) o =>
  Eval (Maybe1 Just) o
