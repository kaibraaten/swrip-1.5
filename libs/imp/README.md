# Imp - Improved MudProgs

Imp is an interpreter for a subset of Python. It was written to provide a replacement for
the Merc mudprogs in the [SWRiP 1.5 project](https://github.com/kaibraaten/swrip-1.5). It can
also be used as a standalone interpreter, but you probably want to use a fully fledged Python
interpreter instead, since Imp only supports a small part of the language.

In particular Imp can handle the following things:

* Functions as first class objects including closures.
* Lambda expressions.
* Integers, floats, strings, bools, None, lists and dicts (only a small subset of
  operations are supported on most types).
* `for` and `while` loops.
* `if`, `elif` and `else`.
* Logical operators `and`, `or`, `not`.
* Arithmetic operators `+`, `-`, `*`, `/`, `//` and `%`.
* Comparison operators `==`, `!=`, `<`, `>`, `<=` and `>=`.
* Minimalistic function library: `range(from, to)`, `input(prompt)`, `str(var)`
  `int(var)`, `float(var)`, `print(arg1 [, arg2 [, etc]])`,
  `len(list, dict or string)` and `exit(code)`.
* Single line comments starting with `#`.

The above list may seem very limited, but you can really do whatever you need with
just that functionality. Remember that this interpreter was created for the express
purpose of scripting events with a game. If you need to write more advanced code then
you're probably better off writing that on the C++ side.

It's compatible with Python such that a valid Imp script is also a valid
Python script. The opposite is obviously not true.

---

This library contains no Diku derived code, and is released under the
[MIT license](https://mit-license.org/) as reproduced below:

## The MIT License (MIT)
Copyright © 2020 Kai Braaten

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the “Software”), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
