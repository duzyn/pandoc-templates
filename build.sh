#!/bin/bash

rm -rf ./examples/MANUAL-*.*

# Update Pandoc MANUAL.txt
wget -P ./examples \
    -N https://cdn.jsdelivr.net/gh/jgm/pandoc/MANUAL.txt

# Github
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-github.html \
    -d ./defaults/html5_github.yml

# Marx
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-marx.html \
    -d ./defaults/html5_marx.yml

# Tufte
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-tufte.html \
    -d ./defaults/html5_tufte.yml

# Eisvogel
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-eisvogel.pdf \
    -d ./defaults/latex_eisvogel.yml

# weasyprint
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-weasyprint.pdf \
    -d ./defaults/pdf_weasyprint.yml

# wkhtmltopdf
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-wkhtmltopdf.pdf \
    -d ./defaults/pdf_wkhtmltopdf.yml

# EPUB
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL.epub \
    -d ./defaults/epub_ebook.yml
