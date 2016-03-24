.PHONY : all markdown clean check

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
print(arg.fig)
endef

export knit_code

OBJ_MD = $(wildcard _manuals/*.md)

all: markdown

markdown: $(OBJ_MD)

%.md: %.Rmd
	echo "$$knit_code" | R -q --no-save --args $<

%.md: %.rmd
	echo "$$knit_code" | R -q --no-save --args $<

clean:
	rm -r tmp/

check:
	open http://localhost:4000
