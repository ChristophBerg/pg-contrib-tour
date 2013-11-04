#!/usr/bin/make
LATEXMK=latexmk
CONFIG_OPT=-r ./pdflatexmkrc
BUILD_OPT=-pdf
CLEAN_OPT=-C
FORCE_OPT=-f

.PHONY: all clean force $(wildcard *.tex)

all:
	$(LATEXMK) $(BUILD_OPT) $(CONFIG_OPT)

clean:
	$(LATEXMK) $(CLEAN_OPT) $(CONFIG_OPT)
	-find . -regex '.*\.acn\|.*\.acr\|.*\.alg\|.*\.aux\|.*\.bbl\|.*\.glg\|.*\.glo\|.*\.gls\|.*\.ist\|.*\.nav\|.*\.snm\|.*\.bib\|.*\.synctex\.gz\|.*\.vrb\|.*~\$\|.*\.backup' -print0 -type f | xargs -0 rm -f

force:
	$(LATEXMK) $(FORCE_OPT) $(BUILD_OPT) $(CONFIG_OPT)

$(wildcard *.tex):
	$(LATEXMK) $(BUILD_OPT) $(CONFIG_OPT) $@
