module PSPS where

import Type.Data.Peano (kind Nat)

foreign import kind Expr

foreign import kind Result

foreign import kind ModuleName

foreign import data Constructor :: Symbol -> Symbol -> Nat -> Expr

class Expr (expr :: Expr) (result :: Result) | expr -> result

-- binds and modulename (ie Foo.Bar) and a name (ie Baz) to an expression
-- this is then used by `Var` during the lookup phase
class Bind (path :: ModuleName) (name :: Symbol) (expr :: Expr) | path name -> expr
