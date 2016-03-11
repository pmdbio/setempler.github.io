---
layout: manual
title:  "rmd"
---

## compile Rmd format

Automated .rmd to .md and .md to .html script if RStudio is not available
still there are some options missing to generate the same output as in
RStudio such as recognizing the .md header.

```r
if (!require(knitr) | !require(markdown))
  stop("Install knitr or markdown.")

# knit R markdown to markdown
files <- list.files(".", "\\.rmd")
for (f in files)
  knit(f, sub("\\.rmd$", ".md", f), envir = new.env())

# generate html versions
files <- list.files(".", "\\.md")
for (f in files)
  markdownToHTML(f, sub("\\.md$", ".html", f))

#markdownHTMLOptions()
#markdownExtensions()
```
