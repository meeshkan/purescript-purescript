// These functions are not supposed to be called. The FFI interfaces with type-level PureScript, not JavaScript. These functions are there because they're required for the PureScript compiler to accept the uncompiled PureScript.
const error = () => throw Exception('Unimplemented')
exports.intAdd = error;
exports.intMul = error;
