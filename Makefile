.PHONY: all quick clean final

latex = pdflatex -halt-on-error -file-line-error
bibtex = bibtex
target = summary

all:
	$(latex) $(target)
	-$(bibtex) $(target)
	$(latex) $(target)
	$(latex) $(target)

quick:
	rubber -n 1 -W refs -W misc --pdf $(target)
clean:
	rm -f *.aux *.log *.out *.bbl *.blg
	rm -f *.toc *.snm *.nav
	rm -f orig-$(target).pdf

final: all
	mv $(target).pdf orig-$(target).pdf
	gs -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress \
	    -dNOPAUSE -dBATCH -sDEVICE=pdfwrite \
	    -sOutputFile=$(target).pdf orig-$(target).pdf
