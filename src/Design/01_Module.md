# Module

At the module level, all exported functions are bound to the toplevel context via the `Bind` typeclass. They are bound via a lifting typelcass that lifts module-level binds to exported binds.

In the case of this module, `Hello` and `World` are lifted to the toplevel whereas `See` and `You` are not.

The toplevel context of variable bindings is just called `Bind`, and every module has `Module_Name_Bind` that is lifted to the toplevel context via a special `Lift` typeclass.

A similar strategy should be used for nested contexts, but in the opposite direction. When we export things, we inject them into the toplevel context. When we use a `let` statement, we push an outer value into an inner context. So instead of `Lift` we want `Lower`. For example, `module Foo(Bar)` lifts `Bar` into the toplevel context, whereas `let a = 1 in a + 3` lowers `a` into the context `a + 3`.

In general, every context has its own `Expr` kind and `Bind` typeclass, and lifting or lowering is done via typeclasses.

## Constructors

There are two ways to handle constructors: using the symbol class and using `kind` and `data`.

`kind` and `data` is more concise (see `01_Module_trans_alt`), but it still needs to be wrapped to be treatable by the top-level eval, which means that there is a proliferation of `data` of `kind Expr`, one for every ary of constructor (ie nullary, unary, etc). The advantage is that the arity of constructors is known at compile-time, and you can curry type constructors just like functions.

Intuitively, the representation with `kind` and `data` seems more human-readable and human followable. It also creates a 1-to-1 mapping: `data` always maps to `kind` and constructor always maps to `data`. This is how `Prim.Boolean` works, for example, and it would probably be cleaner overall design.
