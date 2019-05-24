SHELL=/bin/bash
DOC=diplom

all:
	python3 ./grap/grap_gen.py
	latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=./ $(DOC).tex

clean:
	rm ./grap/*.pgf ./grap/*.pdf
	rm *.aux *.log *.out *.toc *.pdf *.fls *.gz *_latexmk