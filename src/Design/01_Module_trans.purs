module PSPS.PSPS.Design.Module where

import PSPS (class Bind, Constructor, kind Expr, kind ModuleName)
import Type.Data.Peano (Z, kind Nat)

foreign import kind PSPS_Design_Module_Bind

foreign import kind PSPS_Design_Module_Expr

foreign import kind PSPS_Design_Module_Result

foreign import data PSPS_Design_Module :: ModuleName

foreign import data PSPS_Design_Module_NonRec :: Symbol -> Expr -> PSPS_Design_Module_Bind

foreign import data PSPS_Design_Module_Constructor :: Symbol -> Symbol -> Nat -> PSPS_Design_Module_Expr

class PSPS_Design_Module_Lift (expr' :: PSPS_Design_Module_Expr) (expr :: Expr) | expr' -> expr

class PSPS_Design_Module_Expr (expr :: PSPS_Design_Module_Expr) (result :: PSPS_Design_Module_Result) | expr -> result

class PSPS_Design_Module_Bind (path :: Symbol) (expr :: PSPS_Design_Module_Expr) | path -> expr

instance lift'Constructor :: PSPS_Design_Module_Lift (PSPS_Design_Module_Constructor s0 s1 n) (Constructor s0 s1 n)

instance bind'Hello'PSPS_Design_Module :: PSPS_Design_Module_Bind "Hello" (PSPS_Design_Module_Constructor "Hello" "Hello" Z)

instance bind'World'PSPS_Design_Module :: PSPS_Design_Module_Bind "World" (PSPS_Design_Module_Constructor "Hello" "World" Z)

instance bind'See'PSPS_Design_Module :: PSPS_Design_Module_Bind "See" (PSPS_Design_Module_Constructor "Goodbye" "See" Z)

instance bind'You'PSPS_Design_Module :: PSPS_Design_Module_Bind "You" (PSPS_Design_Module_Constructor "Goodbye" "You" Z)

instance bind'PSPS_Design_Module_Hello ::
  ( PSPS_Design_Module_Bind "Hello" expr'
  , PSPS_Design_Module_Lift expr' expr
  ) =>
  Bind PSPS_Design_Module "Hello" expr

instance bind'PSPS_Design_Module_World ::
  ( PSPS_Design_Module_Bind "World" expr'
  , PSPS_Design_Module_Lift expr' expr
  ) =>
  Bind PSPS_Design_Module "World" expr
