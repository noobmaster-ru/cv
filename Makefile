# Структура: <язык>/<вариант>/<файл>.tex -> .pdf в той же папке.
#   ru/  backend/ ml/ fd/      русские версии
#   eng/ backend/ ml/ fd/      английские версии (в eng/ml/ также адресная версия под Plata)
# Плюс копии под именами, под которыми резюме отправляются.

LATEX = pdflatex -interaction=nonstopmode -halt-on-error

PDFS = ru/ml/cv_ru_ml.pdf \
       ru/backend/cv_ru_backend.pdf \
       ru/fd/cv_ru_fde.pdf \
       eng/ml/cv_eng_ml.pdf \
       eng/ml/cv_eng_plata.pdf \
       eng/backend/cv_eng_backend.pdf \
       eng/fd/cv_eng_fde.pdf

COPIES = ru/ml/козлов_кирилл_мл.pdf \
         ru/backend/козлов_кирилл_python.pdf \
         eng/backend/kozlov_kirill_python.pdf

all: $(PDFS) $(COPIES)

# Общее правило: любой .tex собирается в .pdf рядом с собой
%.pdf: %.tex
	$(LATEX) -output-directory=$(dir $<) $<

# Копии для отправки: имя файла видно рекрутеру, поэтому оно осмысленное
ru/ml/козлов_кирилл_мл.pdf: ru/ml/cv_ru_ml.pdf
	cp $< $@

ru/backend/козлов_кирилл_python.pdf: ru/backend/cv_ru_backend.pdf
	cp $< $@

eng/backend/kozlov_kirill_python.pdf: eng/backend/cv_eng_backend.pdf
	cp $< $@

tex: all

clean:
	find ru eng -name '*.aux' -o -name '*.log' -o -name '*.out' | xargs rm -f

.PHONY: all tex clean
