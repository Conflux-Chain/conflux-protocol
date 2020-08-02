all: tech-specification.pdf

tech-specification.pdf: *.tex reference.bib figs/* SelfArx.cls
	bash version.sh build
	pdflatex tech-specification
	bibtex tech-specification
	pdflatex tech-specification
	pdflatex tech-specification
	bash version.sh remove

cleancache:
	rm -f *.blg *.aux *.log *.bbl

clean:
	rm -f *.blg *.pdf *.dvi *.ps *.aux *.log *.bbl tech-specification.pdf
