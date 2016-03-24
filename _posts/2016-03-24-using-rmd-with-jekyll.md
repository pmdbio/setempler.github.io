---
layout: post
title:  "Using Rmd with jekyll"
date:   2016-03-24
categories: jekyll knitr rmd
---

To use R markdown files with jekyll, one needs to render/compile them first.
You can generate static html files easily by using the rmarkdown package and
a command such as `rmarkdown::render("file.Rmd")`.

Nevertheless, html files loose jekyll header information. On the other hand, the
rendered markdown files do not contain images, thus, they must be copied to
a location jekyll knows about.

Here is an example of an R script to compile the markdown `.md` file from the
Rmarkdown `.Rmd` file. It stores the figures in (subfolders) of `images/`,
and the markdown files in `_manuals/` for the collection named *manuals*.

```r
#!/usr/bin/env Rscript
require(knitr)
args <- commandArgs(T)
arg.in <- args[1]
arg.out <- "_manuals/"
arg.fig <- "images/"
arg.url <- "/"
arg.base <- sub(".[Rr]md$", "", basename(arg.in))
arg.fig <- paste0(arg.fig, arg.base, "/")
arg.md <- paste0(arg.out, arg.base, ".md")
opts_knit$set(base.url = arg.url)
opts_chunk$set(fig.path = arg.fig)
opts_chunk$set(fig.cap = "center")
# render_jekyll() # if you want to use jekyll code block highlighting
knit(arg.in, output = arg.md, envir = parent.frame())
```

Call the script with the argument of the file to compile:

```bash
./myscript _manuals/file.Rmd
```

One can also use a `Makefile` to automate this:

```make
# Makefile

.PHONY : markdown

define knit_code
require(knitr)
args <- commandArgs(T)
arg.in <- args[1]
arg.out <- "_manuals/"
arg.fig <- "images/"
arg.url <- "/"
arg.base <- sub(".[Rr]md$$", "", basename(arg.in))
arg.fig <- paste0(arg.fig, arg.base, "/")
arg.md <- paste0(arg.out, arg.base, ".md")
opts_knit$$set(base.url = arg.url)
opts_chunk$$set(fig.path = arg.fig)
opts_chunk$$set(fig.cap = "center")
knit(arg.in, output = arg.md, envir = parent.frame())
endef

export knit_code
OBJ_MD = $(wildcard _manuals/*.md)

markdown: $(OBJ_MD)
%.md: %.Rmd
  @echo "$$knit_code" | R -q --no-save --args $<
%.md: %.rmd
  @echo "$$knit_code" | R -q --no-save --args $<
```

First, we `define` and `export` a shell variable (`knit_code`), containing the
R code for rendering an `Rmd` file to markdown.  
Then, all markdown files (from the `_manuals` folder) are stored in the Makefile
variable `OBJ_MD` and assigned as targets for the `markdown` rule, which is the
default in this example. All existing and modified `.Rmd` or `.rmd` files are
rendered in the end.

To (force) compilation, run make with the `-B` argument:

```bash
make -B
make -B _manuals/file.md
```

Sven

---

Credits:

R code modified after [www.jonzelner.net][credit1]

[credit1]: http://www.jonzelner.net/jekyll/knitr/r/2014/07/02/autogen-knitr/
