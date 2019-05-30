SHELL=/bin/bash
DOC=diplom

all:
	python3 ./grap/grap_gen.py
	latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=./ $(DOC).tex

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.gz *_latexmk *.synctex.gz