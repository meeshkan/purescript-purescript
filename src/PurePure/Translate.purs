module PurePure.Translate where

import Prelude
import CoreFn.FromJSON (moduleFromJSON)
import CoreFn.Ident (Ident(..))
import CoreFn.Module (ModuleImport(..))
import CoreFn.Names (ModuleName(..), ProperName(..))
import Data.Newtype (unwrap)
import Foreign (F)
import Prim.Boolean (kind Boolean)
import Type.Data.Peano (kind Int)

-- The real work hasn't been done yet for this project, and it is recursing through
-- expression tree and making the appropriate substitutions.
--
-- For example:
-- - `ObjectUpdate` is achieved with `Union`.
-- - `App` (of the form `myFunc myVal`) is achieved with
--       `ExprApp myFunc myVal myRes` (see `instanceExprApp` below)
-- - `Case` is split out into a bunch of if/then clauses.
-- - etc.
--
-- These will need to be stored in some intermediary format before
-- outputting to the String that represents the new module. For example,
-- while in PureScript `App a b` is valid corefn, in typelevel programming,
-- we would need both the representation as a TypeExpr and the corresponding
-- typeclass.
--
-- instanceExprApp :: (EvalExpr a a', EvalExpr b b', ExprApp a' b' c) => EvalExpr (App' (a b)) c
--
-- Corefn does not output types, but that doesn't matter here.
-- Esentially, there are only two kinds: Expr' and Literal'.
-- Expr' mimics the arboreal representation in corefn.
-- In some cases, an expression will contain `Literal'`.
-- `Literal'` is a wrapper arond all the primitives (Number, Boolean, etc)
-- and it is only when it is fed to low-level typeclasses.  For example,
-- we will define addition over the integers as roughtly as:
--
-- class AddInt (l :: Literal') (r :: Literal') (o :: Literal') | l r -> o
-- instance addInt :: (
--   ...typelevel addition goes here, producing o...
-- ) => AddInt (Literal'Int l) (Literal'Int r) o
--
-- Because the kind Literal' is used all the way until ffi specialization, we don't need to worry
-- about any kind other than Literal' for computations in `corefn`.
--
foreign import kind Literal'

-- https://pursuit.purescript.org/builtins/docs/Prim#t:Char
-- we will guarantee by construction that the symbol only contains
-- one string. this is like the JavaScript implementation
foreign import data CharLiteral' :: Symbol -> Literal'

-- https://pursuit.purescript.org/builtins/docs/Prim#t:String
foreign import data StringLiteral' :: Symbol -> Literal'

-- https://pursuit.purescript.org/builtins/docs/Prim#t:Int
foreign import data IntLiteral' :: Int -> Literal'

-- https://pursuit.purescript.org/builtins/docs/Prim#t:Boolean
foreign import data BooleanLiteral' :: Boolean -> Literal'

foreign import kind Expr'

foreign import data Literal' :: Literal' -> Expr'

foreign import data Accessor' :: Symbol -> Expr' -> Expr'

foreign import data App' :: Expr' -> Expr' -> Expr'

-- initial sketch of renaming toplevel imports and exports
pure'Ident :: Ident -> Ident
pure'Ident UnusedIdent = UnusedIdent

pure'Ident (GenIdent m i) = GenIdent (m >>= \s -> pure $ "Pure'" <> s) i

pure'Ident (Ident s) = Ident $ "Pure'" <> s

pure'ModuleName :: ModuleName -> ModuleName
pure'ModuleName m = ModuleName ([ ProperName "Pure'" ] <> (unwrap m))

translateModule :: String -> F String
translateModule s = do
  m <- moduleFromJSON s
  let
    mod' = unwrap m.module
  let
    moduleName = pure'ModuleName mod'.moduleName
  let
    moduleExports = map pure'Ident mod'.moduleExports
  let
    moduleImports =
      map
        ( \(ModuleImport mi) ->
            ModuleImport $ mi { moduleName = pure'ModuleName mi.moduleName }
        )
        mod'.moduleImports
  pure ""
