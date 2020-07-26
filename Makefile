all: tech-specification.pdf

tech-specification.pdf: *.tex reference.bib figs/* SelfArx.cls
	pdflatex tech-specification
	bibtex tech-specification
	pdflatex tech-specification
	pdflatex tech-specification

cleancache:
	rm -f *.blg *.aux *.log *.bbl

clean:
	rm -f *.blg *.pdf *.dvi *.ps *.aux *.log *.bbl tech-specification.pdf
