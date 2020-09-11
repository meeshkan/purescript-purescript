module FFI.PSPS.Design.InitialPoC.Trans where

import PSPS (App, Foreign, Literal, Prim'Int, kind Expr, kind FFIName)
import Type.Data.Peano (class ProductInt, class SumInt)

class FFI_PSPS_Design_InitialPoC_Trans_Eval (expr :: Expr) (result :: Expr) | expr -> result

foreign import data Foreign'intAdd :: FFIName

instance iFFI_PSPS_Design_InitialPoC_Trans_Eval'intAdd'intAddE'App ::
  SumInt a b c =>
  FFI_PSPS_Design_InitialPoC_Trans_Eval (App (App (Foreign Foreign'intAdd) (Literal (Prim'Int a))) (Literal (Prim'Int b))) (Literal (Prim'Int c))

foreign import data Foreign'intMul :: FFIName

instance iFFI_PSPS_Design_InitialPoC_Trans_Eval'intMul'intMulE'App ::
  ProductInt a b c =>
  FFI_PSPS_Design_InitialPoC_Trans_Eval (App (App (Foreign Foreign'intMul) (Literal (Prim'Int a))) (Literal (Prim'Int b))) (Literal (Prim'Int c))
