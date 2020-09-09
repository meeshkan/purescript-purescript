module Translate where

import Prelude
import CoreFn.Ann (Ann)
import CoreFn.FromJSON (moduleFromJSON)
import CoreFn.Ident (Ident(..))
import CoreFn.Module (Module(..), ModuleImport(..))
import CoreFn.Names (ModuleName(..), ProperName(..))
import Data.Newtype (unwrap)
import Foreign (F)

pure'Ident :: Ident -> Ident
pure'Ident UnusedIdent = UnusedIdent

pure'Ident (GenIdent m i) = GenIdent (m >>= \s -> pure $ "Pure'" <> s) i

pure'Ident (Ident s) = Ident $ "Pure'" <> s

pure'ModuleName :: ModuleName -> ModuleName
pure'ModuleName m = ModuleName ([ ProperName "PurePure" ] <> (unwrap m))

translateModule :: String -> F (Module Ann)
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
  pure
    $ Module
        ( mod'
            { moduleName = moduleName
            , moduleExports = moduleExports
            , moduleImports = moduleImports
            }
        )
