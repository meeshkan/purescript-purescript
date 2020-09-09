# Function

The difference between a function and a constructor is minimal. The representation in general of abstraction could be:

```haskell
data Abs :: Symbol -> Expr -> Expr -> Expr -> Expr
```

ie negate:

```haskell
(Abs "negate" x y z)
```

where `x` and `y` are known and `z` is solved for via a typeclass.

This would then need to cascade down through scopes via lowering (see `01_Module.md`) so that there aren't 1,000,000 `Eval` constraints for `Abs`. Rather, every scope can have its own `Eval` scope that will interact with outer/inner scopes through lifting/lowering.
