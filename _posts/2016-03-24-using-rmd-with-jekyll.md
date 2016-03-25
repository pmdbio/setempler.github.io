---
layout: post
title:  "Using Rmd with jekyll"
date:   2016-03-24
categories: jekyll knitr rmd
---

## Introduction

To use R markdown (ending `.Rmd`) files with jekyll, one needs to render/compile
them first. You can generate static html files easily by using an R command such
as `rmarkdown::render("file.Rmd")`, when you have *R* and the package
*rmarkdown* and its dependency *knitr* installed.

Nevertheless, `.html` output files do not contain jekyll header information any
more (like layout and title). On the other hand, the rendered markdown `.md`
files do not contain compiled images/figures, thus, they must be copied to a
location jekyll knows about (by default it is just a subfolder, named as the
`.Rmd` file).

The following code refers to a collection of markdown sites, called *manuals*,
which is, similar to a blog, implemented as a list of links into a main page.
The instructions work as well for `_post` blog entries, modify the R code's
arguments, therefore.

## Configure jekyll to ignore `.Rmd` files

Each R markdown file already has the yaml header for jekyll integrated, like the
following:

```yaml
---
layout: manuals
title: mytitle
---
```

Thus, if you compile a Markdown file from the Rmarkdown one, you will get
duplicated entries with jekyll. Thus, to exclude the original files, an entry is
required at `_config.yml`. Add the following code to the configuration file:

```yaml
# add to _config.yml
exclude:
  - "*.Rmd"
```

As alternative, source folders of `.Rmd` and `.md` files can differ, and the
folder of the original files can be excluded. However, in this example I keep
the sources with the compiled versions.

## Rmarkdown to Markdown with R and knitr

Here is an example of an R script to compile the `.md` file from the
Rmarkdown `.Rmd` file. It takes three arguments, the first defines the *input*
file name, which is the R markdown file. The second is the *markdown output*
directory, and the third the *image output* directory.

```r
# file ~/knit2md
require(knitr)
args <- commandArgs(T)
arg.in <- args[1]
arg.out <- args[2]
arg.fig <- args[3]
arg.url <- "/"
arg.base <- sub(".Rmd$", "", basename(arg.in))
arg.fig <- paste0(arg.fig, arg.base, "/")
arg.md <- paste0(arg.out, arg.base, ".md")
opts_knit$set(base.url = arg.url)
opts_chunk$set(fig.path = arg.fig)
opts_chunk$set(fig.cap = "center")
# render_jekyll() # if you want to use jekyll code block highlighting
knit(arg.in, output = arg.md, envir = parent.frame())
```

A call to the script could look like this:

```bash
Rscript ~/knit2md _manuals/file.Rmd _manuals/ images/
```

## Use a Makefile

One can also use a `Makefile` to automate this.

The Makefile must be placed into the root of the project, where the output
folders `_manuals` and `images` reside. The Makefile checks every `.md` file,
and if it has a source file (with the same name, but a `.Rmd` ending).
In case the source was modified, the script is echoed to *R* creating the
output as above.

```make
# Makefile
.PHONY : markdown

define knit_code
require(knitr)
args <- commandArgs(T)
arg.in <- args[1]
arg.out <- args[2]
arg.fig <- args[3]
arg.url <- "/"
arg.base <- sub(".Rmd$$", "", basename(arg.in))
arg.fig <- paste0(arg.fig, arg.base, "/")
arg.md <- paste0(arg.out, arg.base, ".md")
opts_knit$$set(base.url = arg.url)
opts_chunk$$set(fig.path = arg.fig)
opts_chunk$$set(fig.cap = "center")
knit(arg.in, output = arg.md, envir = parent.frame())
endef

export knit_code

MAN_DIR = _manuals
MAN_OBJS = $(wildcard $(MAN_DIR)/*.Rmd)
MAN_OBJS := $(MAN_OBJS:.Rmd=.md)

$(MAN_DIR)/%.md: $(MAN_DIR)/%.Rmd
	@echo $< to $@
	@echo "$$knit_code" | R -q --no-save --args $< "$(MAN_DIR)/" "images/"

markdown: $(MAN_OBJS)
```

First, we `define` and `export` a shell variable (`knit_code`), containing the
R code for rendering an `Rmd` file to markdown. This we need to do (instead of
  calling `R -e 'code...'`, since the Makefile requires line breaks (`\`) added,
  to not interpret new lines as new shell commands.
Then, all markdown files (from
the `_manuals` folder) are stored in the Makefile variable `OBJS` and assigned
as targets for the `markdown` rule. All existing and modified `.Rmd` or `.rmd`
files are rendered in the end.

To (force) compilation, run make with the `-B` argument:

```bash
make -B
make -B _manuals/file.md
```

## Examples

See an example at the [source code][git] for this site.

Sven

---

Credits:

R code modified after [www.jonzelner.net][credit1]

[git]: http://github.com/setempler/setempler.github.io
[credit1]: http://www.jonzelner.net/jekyll/knitr/r/2014/07/02/autogen-knitr/
