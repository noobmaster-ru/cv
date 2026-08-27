# Четыре PDF из двух исходников: cv_ru.tex и cv_eng.tex.
# Вариант резюме выбирается макросом \target: ml или backend.
# Плюс копии русских версий под именами, под которыми они отправляются.

LATEX = pdflatex -interaction=nonstopmode -halt-on-error
PDFS = cv_ru_ml.pdf cv_ru_backend.pdf cv_eng_ml.pdf cv_eng_backend.pdf
COPIES = козлов_кирилл_мл.pdf козлов_кирилл_python.pdf

all: $(PDFS) $(COPIES)

cv_ru_ml.pdf: cv_ru.tex
	$(LATEX) -jobname=cv_ru_ml "\def\target{ml}\input{cv_ru.tex}"

cv_ru_backend.pdf: cv_ru.tex
	$(LATEX) -jobname=cv_ru_backend "\def\target{backend}\input{cv_ru.tex}"

cv_eng_ml.pdf: cv_eng.tex
	$(LATEX) -jobname=cv_eng_ml "\def\target{ml}\input{cv_eng.tex}"

cv_eng_backend.pdf: cv_eng.tex
	$(LATEX) -jobname=cv_eng_backend "\def\target{backend}\input{cv_eng.tex}"

# Копии для отправки: имя файла видно рекрутеру, поэтому оно осмысленное
козлов_кирилл_мл.pdf: cv_ru_ml.pdf
	cp $< $@

козлов_кирилл_python.pdf: cv_ru_backend.pdf
	cp $< $@

tex: all

clean:
	rm -f *.aux *.log *.out

.PHONY: all tex clean
