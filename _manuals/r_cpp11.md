---
layout: manual
title:  "R C++11"
---

This is a manual of short length how to use the _Rcpp11_ package in R.
_Rcpp11_ is a complete redesign of _Rcpp_, targetting C++11.
It is written as a header component linking R objects to C++ code.

### Installation

The code of the package _Rcpp11_ is placed on [__github__](http://github.com/Rcpp11/Rcpp11) or on [__CRAN__](http://cran.r-project.org/web/packages/Rcpp11).


#### Install from Github

You can install the package from github. For this you will need to install the
package _devtools_ from CRAN. The following commands do install and load the
requirement, and the install _Rcpp11_.

```r
install.packages("devtools")
require(devtools)
install_github("Rcpp11/Rcpp11")
install_github("Rcpp11/attributes")
```


#### Install from CRAN

Installing the package from CRAN and loading is done with the following
command.

```r
install.package("Rcpp11")
```


### Packages

To use within compilation of an R package, put the following into the package DESCRIPTION file:

```
UseDynlib: Rcpp11
SystemRequirements: C++11
```

In the file NAMESPACE you have to put

```
LinkingTo()
```

* `LinkingTo: Rcpp11`
* `compileAttributes("MyPackage")`
* `#' @importFrom Rcpp sourceCpp`


### Use .cpp/.hpp Files

When you store code of your Rcpp functions in program (`.cpp`) or header files
(`.hpp`) include the Rcpp11 header files and export the function via the RcppExport file add the next lines.

```cpp
#include <Rcpp11>
// [[export]]
```

### Initialize Vectors

R style vectors can be created in different ways. One is defining an array with
`{}` or `create` and another is by importing a C++ object with `import` on the
object or iterators.

```cpp
// type the array
NumericVector x = { 1.0, 2.0, 3.0 };
NumericVector x = create(1.0, 2.0, 3.0);
// ... and add names
NumericVector x = create(_["a"]=1.0, _["b"]=2.0, _["c"]=3.0);
// define size (filled with 0/false/empty)
NumericVector x(3);
// fill by element
NumericVector x(3, 1.0);
NumericVector x = replicate(10, 2.3);
// import from std::vector/iterator
std::vector v;
NumericVector x = import(v);
NumericVector x = import(begin(v), end(v));
```


### Concatenate Vectors

Concatenate vectors by calling `fuse`, the function `c` in R.
```cpp
NumericVector x = fuse(y, z);
```


### S4 Objects

> To be generated ...

### Environments, R Functions

```cpp
Rcpp::Environment base("package:base");
Rcpp::Function foo = base["mean"];
```

or

```cpp
Rcpp::Environment("package:base")["mean"];
Rcpp::Function foo("mean");
```
