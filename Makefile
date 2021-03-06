SHELL=/bin/bash

THEME = Математическая модель импульсного погружателя, оптимального по коэффициенту асимметрии
STUDENT = А.А. Уткин
DEGREE = д.ф.-м.н.
DIRECTOR = Д.В. Костин
SED = "s/{{theme}}/${THEME}/; s/{{student}}/${STUDENT}/; s/{{degree}}/${DEGREE}/; s/{{director}}/${DIRECTOR}/"
DOC = diplom

all: titlepage
	python3 ./grap/grap_gen.py
	pdflatex diplom.tex
	biber diplom
	pdflatex diplom.tex
	pdflatex diplom.tex

pdflatex:
	@pdflatex diplom.tex

titlepage:
	@sed -e ${SED} titlepage.fodt > tp-output.fodt
	libreoffice --headless --convert-to pdf tp-output.fodt

overfull:
	@pdflatex diplom.tex | grep -va Underfull | grep  -a . | grep -aC 12 Overfull
	@pdflatex diplom.tex | grep -c Overfull

install_venv:
	@./install_venv.sh

install_pack:
	@./install_pack.sh

clean:
	rm -f ./grap/*.pdf
	rm -f *.aux *.bbl *.bcf *.blg *.log *out *.run.xml *.toc
