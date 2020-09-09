module PSPS where

import Type.Data.Peano (kind Nat)

foreign import kind Bind

foreign import kind Expr

foreign import kind Result

foreign import kind ModuleName

foreign import data NonRec :: Symbol -> Expr -> Bind

foreign import data Constructor :: Symbol -> Symbol -> Nat -> Expr

class Expr (expr :: Expr) (result :: Result) | expr -> result

class Bind (path :: ModuleName) (name :: Symbol) (expr :: Expr) | path name -> expr
