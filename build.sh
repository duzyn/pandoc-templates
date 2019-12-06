#!/bin/bash

rm -rf ./examples/MANUAL-*.*

# Update Pandoc MANUAL.txt
wget -P ./examples -N https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt

# Update Eisvogel LaTeX template
wget -P ./templates -N https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex

# Update Tufte Handout LaTeX template
wget -P ./templates -N https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex

# Github
pandoc ./examples/MANUAL.txt -o ./examples/MANUAL-github.html -d html5_github.yml -M lang=en

# Marx
pandoc ./examples/MANUAL.txt -o ./examples/MANUAL-marx.html -d html5_marx.yml -M lang=en

# wkhtmltopdf
pandoc ./examples/MANUAL.txt -o ./examples/MANUAL-wkhtmltopdf.pdf -d pdf_wkhtmltopdf.yml -M lang=en

# weasyprint
# pandoc ./examples/MANUAL.txt -o ./examples/MANUAL-weasyprint.pdf -d pdf_weasyprint.yml -M lang=en

# Eisvogel
# pandoc ./examples/MANUAL.txt -o ./examples/MANUAL-eisvogel.pdf -d latex_eisvogel.yml -M lang=en

# EPUB
pandoc ./examples/MANUAL.txt -o ./examples/MANUAL.epub -d epub_ebook.yml -M lang=en
