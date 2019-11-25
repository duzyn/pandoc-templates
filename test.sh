#!/bin/bash
cd ./examples || return

rm -r ./*.*

# Update Pandoc MANUAL.txt
aria2c -o MANUAL.md --allow-overwrite https://github.com/jgm/pandoc/raw/master/MANUAL.txt

# Github
pandoc MANUAL.md -o MANUAL-github.html -f markdown -t html5 -N --toc --template=github.html -V toctitle="Table of Contents"

# Marx
pandoc MANUAL.md -o MANUAL-marx.html -f markdown -t html5 -N --toc --template=marx.html -V toctitle="Table of Contents"

# wkhtmltopdf
pandoc MANUAL.md -o MANUAL-wkhtmltopdf.pdf -f markdown -t html5 -N --toc --template=wkhtmltopdf.html -V toctitle="Table of Contents" -V footer-html=../includes/footer.html

# Eisvogel
pandoc MANUAL.md -o MANUAL-eisvogel.pdf -f markdown --pdf-engine=xelatex -N --toc --template=eisvogel.tex -V titlepage=true -V toc-own-page=true

# EPUB
pandoc MANUAL.md -o MANUAL.epub -f markdown -t epub -N --toc -V toctitle="Table of Contents"

cd ..