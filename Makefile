SHELL=/bin/bash

THEME = Математическая модель импульсного погружателя, оптимального по коэффициенту асимметрии
STUDENT = А.А. Уткин
DEGREE = д.ф.-м.н.
DIRECTOR = Д.В. Костин
SED = "s/{{theme}}/${THEME}/; s/{{student}}/${STUDENT}/; s/{{degree}}/${DEGREE}/; s/{{director}}/${DIRECTOR}/"
DOC = diplom

all:
	sed -e ${SED} titlepage.fodt > tp-output.fodt
	libreoffice --headless --convert-to pdf tp-output.fodt

	python3 ./grap/grap_gen.py
	latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=./ $(DOC).tex

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.gz *_latexmk *.synctex.gz tp-output.*