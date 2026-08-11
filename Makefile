# Четыре PDF из двух исходников: cv_ru.tex и cv_eng.tex.
# Вариант резюме выбирается макросом \target: ml или backend.

LATEX = pdflatex -interaction=nonstopmode -halt-on-error
PDFS = cv_ru_ml.pdf cv_ru_backend.pdf cv_eng_ml.pdf cv_eng_backend.pdf

all: $(PDFS)

cv_ru_ml.pdf: cv_ru.tex
	$(LATEX) -jobname=cv_ru_ml "\def\target{ml}\input{cv_ru.tex}"

cv_ru_backend.pdf: cv_ru.tex
	$(LATEX) -jobname=cv_ru_backend "\def\target{backend}\input{cv_ru.tex}"

cv_eng_ml.pdf: cv_eng.tex
	$(LATEX) -jobname=cv_eng_ml "\def\target{ml}\input{cv_eng.tex}"

cv_eng_backend.pdf: cv_eng.tex
	$(LATEX) -jobname=cv_eng_backend "\def\target{backend}\input{cv_eng.tex}"

tex: all

clean:
	rm -f *.aux *.log *.out

.PHONY: all tex clean
