module PSPS where

import Type.Data.Peano (kind Int, kind Nat)

foreign import kind Expr

foreign import kind ModuleName

foreign import kind FFIName

foreign import kind Literal

foreign import data Constructor :: Symbol -> Symbol -> Nat -> Expr

-------------------------   fn       curry   var
foreign import data Abs :: Symbol -> Nat -> Expr -> Expr

foreign import data Foreign :: FFIName -> Expr

------------------------- a -> b   a       
foreign import data App :: Expr -> Expr -> Expr

foreign import data Literal :: Literal -> Expr

foreign import data Prim'Int :: Int -> Literal

-- evaluates an expression to a result
-- sometimes, in the case of data, the result will mirror the expression
-- for example, imagine you have
-- data Foo = Foo Int
-- and then an application (App (Var Foo) 1)
-- the result will contain the same information as the application (not sure how to encode it)
-- because there is no further reducing to do here.
-- on the other hand, 1+1 (addition of two typelevel integers) should result in 2
class Eval (expr :: Expr) (evaledExp :: Expr) | expr -> evaledExp

-- binds and modulename (ie Foo.Bar) and a name (ie Baz) to an expression
-- this is then used by `Var` during the lookup phase
class Bind (path :: ModuleName) (name :: Symbol) (expr :: Expr) | path name -> expr
