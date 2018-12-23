.PHONY: all quick clean final

latex = xelatex -halt-on-error -file-line-error
bibtex = bibtex
target = main

all:
	$(latex) $(target)
	# -$(bibtex) $(target)
	# $(latex) $(target)
	# $(latex) $(target)

quick:
	rubber -n 1 -W refs -W misc -m xelatex $(target)
clean:
	rm -f *.aux *.log *.out *.bbl *.blg
	rm -f *.toc *.snm *.nav
	rm -f orig-$(target).pdf

final: all
	mv $(target).pdf orig-$(target).pdf
	gs -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress \
	    -dNOPAUSE -dBATCH -sDEVICE=pdfwrite \
	    -sOutputFile=$(target).pdf orig-$(target).pdf
