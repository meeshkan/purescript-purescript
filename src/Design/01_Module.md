# Module

At the module level, all exported functions are bound to the toplevel context via the `Bind` typeclass. They are bound via a lifting typelcass that lifts module-level binds to exported binds.

In the case of this module, `Hello` and `World` are lifted to the toplevel whereas `See` and `You` are not.

The toplevel context of variable bindings is just called `Bind`, and every module has `Module_Name_Bind` that is lifted to the toplevel context via a special `Lift` typeclass.

A similar strategy should be used for nested contexts, but in the opposite direction. When we export things, we inject them into the toplevel context. When we use a `let` statement, we push an outer value into an inner context. So instead of `Lift` we want `Lower`. For example, `module Foo(Bar)` lifts `Bar` into the toplevel context, whereas `let a = 1 in a + 3` lowers `a` into the context `a + 3`.

In general, every context has its own `Expr` kind and `Bind` typeclass, and lifting or lowering is done via typeclasses.
