---
layout: manual
title:  "R S4 classes"
---

Some documentation about S4 class usage in R.

---

* TOC
{:toc}

---

## Definition

To create your own S4 classes and objects, define a class with the `setClass`
function. It requires a the following arguments:

* `Class` : A character string with name of the new class.
* `slots` : A named list or named character vector. The names correspond to the
slot names of that class, and the values (character vectors of length 1) define
the class of objects stored at that slot. If there are no names, then the class
is used.

```r
setClass("N", slots = c(n = "numeric", i = "integer"))
```

## Validity

The S4 system provides a check method for valid objects. It is either defined
during class definition inside `setClass` by the argument `validity`, or after
the class definition with the function `setValidity`. The validity function is
always used when the object is created (by `new` or the generator function, see
paragraph __[Generator](#generator)__), or the function `validObject` is
called on the object.

```r
valid_N <- function (object) {
  valid <- all(object@n > 0, na.rm = TRUE)
  if (valid) return(TRUE)
  else return("Negative values are not allowed.")
}

# use
setValidity("N", valid_N)
# or
setClass("N", slots = c(n = "numeric", i = "integer"),
         validity = valid_N)
```

The validity function should return a character vector which is used as error
message(s) when the validity tests are not passed, or `TRUE` to allow the object
to be created.

## Prototypes

To provide a preset of values, define them with the `prototype` argument.

```r
prototype_N <- list(n = numeric(1.23), i = integer(1))

setClass("N", slots = c(n = "numeric", i = "integer"),
         validity = valid_N,
         prototype = prototype_N)
```

## Generator

The class generator function is defined as `new`. You can also define your own
name for the generator. You can use the name of the class as name of the
generator function. See the chapter __[Objects](#objects)__ how to use the
functions.

```r
N <- setClass("N", slots = c(n = "numeric", i = "integer"),
              validity = valid_N,
              prototype = prototype_N)
```

It initializes an object of the class defined in the argument `Class`. It takes
named arguments as `...`, where the names

# Objects

## Create

To create an object of class `N` as in the examples, call the class generator
function `new(Class, ...)` or `N(...)`. Using `new` you need to provide the
class name in the argument `Class` as a character string.

```r
new("N")
N()
```

## Process of Creation

The process is as listed:

* Slots are assigned with empty values from the defined class. E.g. `integer()`,
`matrix(,0,0)`, `data.frame()` or `list()`.
* If a `prototype` is defined, the slots are assigned with the provided values.
* If a `validity` method is defined, the function is called on the object.

# Generics

To create methods, first the generic has to be defined. Then methods dispatching
on one or several arguments and their classes can be implemented. Special
functions are `initialize` and `show` which are described in the chapter
__[Methods](#methods)__.

## Non Existing

If the function does not yet exist, provide a function skeleton. The call to
`standardGeneric` enables the dispatch.

```r
setGeneric("plotN", function (x, y, ...) standardGeneric("plotN"))
```

When there has not been any method defined (even for `missing` classes), then an
error is returned, when the function is called, which looks like:

```
Error in (function (classes, fdef, mtable)  :
  unable to find an inherited method for function ‘plotN’ for signature ‘"missing"’
```

## Existing, Non Generic

If the function exists, the skeleton is taken as the default method for any
`missing` class, so no error is returned.

```r
plotN <- function (x, y, ...) { cat("Default plotN\n"); plot(x,y,...) }
setGeneric("plotN")
```

## Existing, S4 Generic

If an existing S4 generic function is defined again, then the definition is
replaced by the new one.

## Existing, Primitive

Existing primitive functions (such as `names`) are dispatched at C level and
become generic when methods are defined on them.

## Existing, S3 Generic

Some S4 generics for S3 generics are already defined in the package `stats4`.
Read in chapter __[Packaging](#packaging)__ which ones and how to deal when
integrating those in an own package. When the S3 generic already exists it is
recommended to define S4 and S3 methods, which has the following reasons:

* S4 method is not seen by S3 generic (except __primitive__ or __operators__).
* S4 method for S3 class will not be called for non S4 class objects.
* S3 method will not be called if any eligible non-default S4 method exists.
For example if there is an S4 for class `matrix` then method.matrix (the S3
  method) will not be called.

```r
summary.N <- function (object, ...) {
  cat("N with", length(object@n), "value(s).\n")
}
setMethod("summary", "N", summary.N)
```

# Methods

## Dispatching

Create methods with multiple dispatching with `setMethod`. The `signature`
argument is a named vector providing the classes for the arguments to dispatch.
The `definition` argument contains the method definition. Beside basic classes
(e.g. `matrix`, `numeric`, `raw`, ...), special classes exist: `ANY` means that
any not defined class is dispatched. `missing` means, that the argument
_must not_ exist in the method.

## Simple Methods

```r
setGeneric("plotN", function (x, y, ...) standardGeneric("plotN") )
setMethod("plotN", c(x = "N", y = "missing"), function (x, ...)
  plot(x@n, seq_along(x@n), main = "Classes: N, missing", ...) )
setMethod("plotN", c(x = "N", y = "N"), function (x, y, ...)
  plot(x@n, y@n, main = "Classes: N, N", ...) )
setMethod("plotN", c(x = "N", y = "numeric"), function (x, y, ...)
  plot(x@n, y, main = "Classes: N, numeric", ...) )
```

```r
X <- N(n=1:5)
x <- 1:5
par(mfrow = c(1,3))
plotN(X, pch = 20)
plotN(X, x)
plotN(X, X, col = "green")
```

## Getter and Setter Methods

To get or set values or attributes, it is better to use functions than accessing
slots via `@`. Include `validObject` since only classes of slots are checked,
when values are reassigned as in the following `num<-` method.

```r
setGeneric("num", function (x) standardGeneric("num"))
setMethod("num", c(x="N"), function (x) x@n)

setGeneric("num<-", function (x, ...) standardGeneric("num<-"))
setMethod("num<-", c(x="N"), function (x, value) {
  x@n <- value
  if (validObject(x)) return(x)
})

x <- N()
num(x)
num(x) <- 3.21
num(x)
num(x) <- - 1.23
```

## Initialize Method

Defining an `initialize` method offers another way to generate an object of a
certain class. For example, attributes of objects can be set, or objects can be
imported, processed and assigned to several slots.  
The method generates the object, assigns a `prototype` if defined and stores it
in `.Object`. This has to be the default name of the object. To assign values to
slots, provide arguments specifically in this method. The validity check is not
called automatically.

```r
setMethod(
  "initialize",
  c(.Object = "N"), function (.Object, length = 2, n) {
    if (!missing(n))
      .Object@n <- n
    length(.Object@n) <- length
    length(.Object@i) <- length
    if (validObject(.Object))
      return(.Object)
  })
N()
N(4)
N(4, 0.815)
```

## Show (Print) Method

To provide a `print` method for S4 objects, define the function `show`. The
argument of the objects needs to be `object`.

```r
setMethod("show", c(object = "N"), definition = function (object) {
  cat("Object of class N:",
      head(object@n, 3),
      "... ( length =",
      length(object@n),
      ")\n") } )
N(5)
```

## Dispatch S3 Classes

For S3 classes use `setOldClass` to provide inheritance in S3 style. When an S4
object inherits (`contains`) an S3 object, then S3 methods are available:

```r
setOldClass("data.frame")
setClass("DF", contains = "data.frame")
x <- new("DF", data.frame(x = 1:10, y = seq(1,0,-1/9), z = sample(letters,10)))
class(x[1:2, ])
setMethod("[", "DF", function (x, i, j, ..., drop = TRUE) {
  S3Part(x) <- callNextMethod()
  return(x) })
class(x[1:2, ])
```

# Packaging

The following describes the usage of S4 methods when creating a package.

## Dependencies and Imports

To use S4 in your package, import the `methods` package from the base R
distribution. You will need to add the following to the `DESCRIPTION` file:

```
Imports: methods
```

Also all functions, or the whole namespace of `methods` must be included in
the `NAMESPACE` file. Either add:

```
import(methods)
```

for all functions, or:

```
importFrom(methods, setClass setGeneric, setMethod)
```

for a subset only.

For better compatibility with other packages, it should be avoided defining the
generic in the own package, rather than importing from base packages such as
`stats4`. Then, other packages doing the same are compatible with the methods.
Use `importFrom(stats4, plot)` for example to import the `plot` generic defined
there. See also chapter __[Generics](#generics)__. To find out about exported
functions from base packages, the following code might be of help:

```r
i <- as.data.frame(installed.packages())
subset(i, Priority %in% c("base","recommended"), c("Package", "Priority"))
library(stats4)
readLines(file.path(path.package("stats4"), "NAMESPACE"))
```

Export the functions in addition to the import, to make them available for users
of your package. In roxygen, an R file might keep the following code, when S4
methods for `plot` and `summary` are used:

```r
#' @importFrom stats4 plot summary
NULL
#' @export summary
#' @export plot
```

## Exports

### Export S4 Classes

In packages, you can export S4 classes (and generator functions) at different
ways. The complete syntax in the `NAMESPACE` is:

```
export(N)
exportClasses(N)
```

Using only `export(N)` is possible if a generator function was declared. This
way, the class can be created by users with `new("N", ...)` and `N(...)`, but
the class cannot be extended with subclasses. The roxygen version is:

```r
#' @export N
N <- setClass("N")
```

Using `exportClass(N)` only, prevents the usage of the generator function for
users, despite it might have been declared. This way, a generator can be used
inside the package only. Use roxygen tag `export` this way:

```r
#' @export
N <- setClass("N")
```

or without generator:

```r
#' @export
setClass("N")
```

If both, `export(N)` and `exportClasses(N)` are provided in the `NAMESPACE`
file, and a generator function was declared, full usage of the class is provided
to the users (generating with `new("N", ...)` and `N()` and declaring subclasses
to extend `N`). In roxygen, you need to add `exportClasses` this way:

```r
#' @export N
#' @exportClass N
N <- setClass("N")
```

### Export S4 Generics and Methods

To export methods, use `export()` for generic functions, and `exportMethods()`
for all methods (compared to `S3method()` for S3 methods). A `NAMESPACE` might
contain the following code:

```
export(plotN)
exportMethods(plotN)
```

Using roxygen, this is compiled by the tag `@export` in both cases (generic and
method):

```r
#' @export plotN
setGeneric("plotN",
           def = function (x, y, ...) standardGeneric("plotN"))
#' @export plotN
setMethod("plotN", c("N", "missing"), )
```

# Links

Some good readings are:

* The [(Not So) Short Introduction to S4][short] ([pdf][shortpdf]) by Christophe
Genolini
* The [Advanced R][advr] and [R Packages (Chapter Namespace/Exports)][rpkg]
books of Hadley Wickham

[short]: http://christophe.genolini.free.fr/webTutorial/notSoShort.php
[shortpdf]: https://cran.r-project.org/doc/contrib/Genolini-S4tutorialV0-5en.pdf
[advr]: http://adv-r.had.co.nz/OO-essentials.html
[rpkg]: http://r-pkgs.had.co.nz/namespace.html#exports
