# cv

ATS-friendly резюме, LaTeX. Сборка: `make` (все варианты), `make clean` (убрать .aux/.log/.out).

В каждой папке один исходник `.tex` и один готовый к отправке PDF с именем «Фамилия_Имя_Должность».

```
ru/                                          русские версии
  backend/  cv_ru_backend.tex   -> Козлов_Кирилл_Python-разработчик.pdf
  ml/       cv_ru_ml.tex        -> Козлов_Кирилл_ML-разработчик.pdf
  fd/       cv_ru_fde.tex       -> Козлов_Кирилл_Forward_Deployed_Engineer.pdf
eng/                                         английские версии
  backend/  cv_eng_backend.tex  -> Kirill_Kozlov_Python_Backend_Developer.pdf
            cv_eng_aios.tex     -> Kirill_Kozlov_Software_Engineer.pdf   (адресная: AIOS, Software Engineer, AI Growth)
  ml/       cv_eng_ml.tex       -> Kirill_Kozlov_Machine_Learning_Developer.pdf
            cv_eng_plata.tex    -> Kirill_Kozlov_AI_Engineer_Plata.pdf   (адресная: Plata, AI Engineer Middle/Middle+)
  fd/       cv_eng_fde.tex      -> Kirill_Kozlov_Forward_Deployed_Engineer.pdf
```

Каждый `.tex` самостоятелен. Имя PDF задаётся в Makefile через `-jobname`.
