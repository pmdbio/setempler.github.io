.PHONY : markdown show list check

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
null <- knit(arg.in, output = arg.md, envir = parent.frame())
endef

export knit_code

MAN_DIR = _manuals
MAN_OBJS = $(wildcard $(MAN_DIR)/*.Rmd)
MAN_OBJS := $(MAN_OBJS:.Rmd=.md)

$(MAN_DIR)/%.md: $(MAN_DIR)/%.Rmd
	@echo
	@echo "$$knit_code" | \
	R -q --no-save --args $< "$(MAN_DIR)/" "images/" 2>&1 | \
	sed -e '/^[^A-Za-z]/d' -e '/^[ ]*$$/d'

markdown: $(MAN_OBJS)

show:
	@echo Rmd files:
	@printf '  %s\n' $(MAN_OBJS:.md=.Rmd)

list:
	ls -Rl _manuals/ images/

check:
	open http://localhost:4000
