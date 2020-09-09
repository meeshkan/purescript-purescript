module Translate where

import Prelude
import CoreFn.FromJSON (moduleFromJSON)
import CoreFn.Ident (Ident(..))
import CoreFn.Module (ModuleImport(..))
import CoreFn.Names (ModuleName(..), ProperName(..))
import Data.Newtype (unwrap)
import Foreign (F)
import Prim.Boolean (kind Boolean)
import Type.Data.Peano (kind Int)

-- To translate the module to a string...
-- Output the moduleName, moduleExports and moduleImports as strings
-- Everything gets prefixed with `Pure'` to bring it to the typelevel
--
-- The real work hasn't been done yet for this project, and it is recursing through
-- moduleDecls.  The type of that is `Bind Ann` and it is defined as such.
--
-- data Bind a
--  = NonRec a Ident (Expr a)
--  | Rec (Array (Tuple (Tuple a Ident) (Expr a)))
--
-- In both cases, it's a matter of traversing the `Expr Ann` downwards and making
-- the necessary substitutions.
--
-- For example:
-- - `ObjectUpdate` is achieved with `Union`.
-- - `App` (of the form `myFunc myVal`) is achieved with `Pure'myFunc myVal myRes`, where Pure'myFunc is a typeclass
-- - `Case` is split out into a bunch of if/then clauses.
-- - etc.
--
-- These will need to be stored in some intermediary format before
-- outputting to the String that represents the new module. For example,
-- while in PureScript `App a b` is valid corefn, in typelevel programming,
-- we would need both the representation as a TypeExpr and the corresponding
-- typeclass.  For example:
--
-- instanceExprApp :: (EvalExpr a a', EvalExpr b b', ExprApp a' b' c) => EvalExpr (App (a b)) c
--
-- in the equivalent of an Ident for future consumption. So essentially,
-- all structures are flattened, with the inner-most computations happening at the top.
--
-- Corefn does not output types, but that doesn't matter here.
-- Esentially, there are only two kinds: Expr' and Pure'.
-- Expr' constructs and expression tree in the same way as corefn.
-- In some cases, an expression will contain `Pure'`.
-- `Pure'` is a wrapper arond all the primitives (Number, Boolean, etc)
-- and it is only when it is fed to low-level typeclasses.  For example,
-- we will define addition over the integers as roughtly as:
--
-- class AddInt (l :: Pure') (r :: Pure') (o :: Pure') | l r -> o
-- instance addInt :: (
--   ...typelevel addition goes here, producing o...
-- ) => AddInt (Pure' (Integer l)) (Pure' (Integer l)) o
--
-- Because the kind Pure' is used all the way until ffi specialization, we don't need to worry
-- about any kind other than Pure' for computations in `corefn`.
--
foreign import kind Pure'

-- https://pursuit.purescript.org/builtins/docs/Prim#t:Char
-- we will guarantee by construction that the symbol only contains
-- one string. this is like the JavaScript implementation
foreign import data Pure'Char :: Symbol -> Pure'

-- https://pursuit.purescript.org/builtins/docs/Prim#t:String
foreign import data Pure'String :: Symbol -> Pure'

-- https://pursuit.purescript.org/builtins/docs/Prim#t:Int
foreign import data Pure'Int :: Int -> Pure'

-- https://pursuit.purescript.org/builtins/docs/Prim#t:Boolean
foreign import data Pure'Boolean :: Boolean -> Pure'

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
