# Build
To build, simply type `make`,
to run, type

```
./interpreter <path-to-program>
```

# The language
The language is almost exactly the same as
it was described in the .pdf document. However,
there are some minor changes:
    * Declarations end with a dot (`.`)
    * `if 1 then _` it *not* a syntax error, it is a type error,
        i.e. all expressions come from the same non-terminal symbol `Exp`
    * the `yield` statement is not yet supported

# The examples
Examples of all non-trivial (and some trivial as well)
features can be found in the `examples` subdirectory,
divided into some self-explainatory categories.

Most of the examples are explained with a comment,
starting with `//` (as in C)

# The future
Here's a brief list of things to be done before
the final assessment:

    * Add support for `yield`
    * Enable printing `bool`s
    * Enable functions with multiple parameters
    * Some other, rather trivial, things
