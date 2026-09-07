# Структура: <язык>/<вариант>/<исходник>.tex -> PDF с именем «Фамилия_Имя_Должность» в той же папке.
#   ru/  backend/ ml/ fd/      русские версии
#   eng/ backend/ ml/ fd/      английские версии (в eng/ml/ также адресная версия под Plata)
# Имя PDF задаётся через -jobname, поэтому в папке один исходник и один готовый к отправке файл.

LATEX = pdflatex -interaction=nonstopmode -halt-on-error

PDFS = ru/backend/Козлов_Кирилл_Python-разработчик.pdf \
       ru/ml/Козлов_Кирилл_ML-разработчик.pdf \
       ru/fd/Козлов_Кирилл_Forward_Deployed_Engineer.pdf \
       eng/backend/Kirill_Kozlov_Python_Backend_Developer.pdf \
       eng/ml/Kirill_Kozlov_Machine_Learning_Developer.pdf \
       eng/ml/Kirill_Kozlov_AI_Engineer_Plata.pdf \
       eng/fd/Kirill_Kozlov_Forward_Deployed_Engineer.pdf

all: $(PDFS)

# build(<папка>, <исходник>.tex, <имя PDF без расширения>)
define build
$(LATEX) -output-directory=$(1) -jobname="$(3)" $(1)/$(2)
endef

ru/backend/Козлов_Кирилл_Python-разработчик.pdf: ru/backend/cv_ru_backend.tex
	$(call build,ru/backend,cv_ru_backend.tex,Козлов_Кирилл_Python-разработчик)

ru/ml/Козлов_Кирилл_ML-разработчик.pdf: ru/ml/cv_ru_ml.tex
	$(call build,ru/ml,cv_ru_ml.tex,Козлов_Кирилл_ML-разработчик)

ru/fd/Козлов_Кирилл_Forward_Deployed_Engineer.pdf: ru/fd/cv_ru_fde.tex
	$(call build,ru/fd,cv_ru_fde.tex,Козлов_Кирилл_Forward_Deployed_Engineer)

eng/backend/Kirill_Kozlov_Python_Backend_Developer.pdf: eng/backend/cv_eng_backend.tex
	$(call build,eng/backend,cv_eng_backend.tex,Kirill_Kozlov_Python_Backend_Developer)

eng/ml/Kirill_Kozlov_Machine_Learning_Developer.pdf: eng/ml/cv_eng_ml.tex
	$(call build,eng/ml,cv_eng_ml.tex,Kirill_Kozlov_Machine_Learning_Developer)

eng/ml/Kirill_Kozlov_AI_Engineer_Plata.pdf: eng/ml/cv_eng_plata.tex
	$(call build,eng/ml,cv_eng_plata.tex,Kirill_Kozlov_AI_Engineer_Plata)

eng/fd/Kirill_Kozlov_Forward_Deployed_Engineer.pdf: eng/fd/cv_eng_fde.tex
	$(call build,eng/fd,cv_eng_fde.tex,Kirill_Kozlov_Forward_Deployed_Engineer)

tex: all

clean:
	find ru eng -name '*.aux' -o -name '*.log' -o -name '*.out' | xargs rm -f

.PHONY: all tex clean
