@echo off

cd "%~dp0"

mkdir examples\en
mkdir examples\cn
mkdir templates
mkdir translations

:: Update source

wget -c -O templates\eisvogel.tex https://ghproxy.com/https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex
wget -c -O templates\_tufte-handout-origin.tex https://ghproxy.com/https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex
wget -c -O templates\_github-markdown.css https://ghproxy.com/https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css
wget -c -O pandoc-manual.md https://ghproxy.com/https://raw.githubusercontent.com/jgm/pandoc/main/MANUAL.txt

:: epub.css

copy templates\_base.css+templates\_pandoc.css epub.css

:: Translations

pandoc --print-default-data-file=translations/zh-Hans.yaml > translations\zh-CN.yaml
pandoc --print-default-data-file=translations/zh-Hant.yaml > translations\zh-TW.yaml
pandoc --print-default-data-file=templates/styles.html > templates\_styles.html

:: Test English

pandoc -d defaults\docx.yml --toc -M toc-title=Contents -o examples\en\pandoc-manual.docx pandoc-manual.md
pandoc -d defaults\html-github.yml --toc -M toc-title=Contents -o examples\en\pandoc-manual-github.html pandoc-manual.md
pandoc -d defaults\pdf-eisvogel.yml --toc -M toc-title=Contents -M titlepage=true -o examples\en\pandoc-manual-eisvogel.pdf pandoc-manual.md
@REM pandoc -d defaults\pdf-pagedjs-cli.yml --toc -M toc-title=Contents -o examples\en\pandoc-manual-pagedjs-cli.pdf pandoc-manual.md
:: pandoc -d defaults\pdf-typst.yml --toc -M toc-title=Contents -o examples\en\pandoc-manual-typst.pdf pandoc-manual.md

pandoc -d defaults\pdf-weasyprint.yml --toc -M toc-title=Contents -o examples\en\pandoc-manual-weasyprint.pdf pandoc-manual.md
pandoc -d defaults\pdf-wkhtmltopdf.yml --toc -M toc-title=Contents -o examples\en\pandoc-manual-wkhtmltopdf.pdf pandoc-manual.md
pandoc -d defaults\pdf-xelatex.yml --toc -M toc-title=Contents -o examples\en\pandoc-manual-xelatex.pdf pandoc-manual.md

:: Test Chinese & English

pandoc -d defaults\docx.yml -o examples\cn\README.docx README.md
pandoc -d defaults\html-github.yml -o examples\cn\README-github.html README.md
pandoc -d defaults\pdf-ctexart.yml -o examples\cn\README-ctexart.pdf README.md
pandoc -d defaults\pdf-ctexrep.yml -o examples\cn\README-ctexrep.pdf README.md
pandoc -d defaults\pdf-eisvogel-cn.yml -o examples\cn\README-eisvogel.pdf README.md
@REM pandoc -d defaults\pdf-pagedjs-cli.yml -o examples\cn\README-pagedjs-cli.pdf README.md
pandoc -d defaults\pdf-tufte-handout-cn.yml -o examples\cn\README-tufte-handout.pdf README.md
pandoc -d defaults\pdf-typst.yml -o examples\cn\README-typst.pdf README.md
pandoc -d defaults\pdf-weasyprint.yml -o examples\cn\README-weasyprint.pdf README.md
pandoc -d defaults\pdf-wkhtmltopdf-cn.yml -o examples\cn\README-wkhtmltopdf.pdf README.md
pandoc -d defaults\pdf-xelatex-cn.yml -o examples\cn\README-xelatex.pdf README.md
