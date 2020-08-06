#!/bin/bash

rm -rf ./examples/MANUAL-*.*

# Update Pandoc MANUAL.txt
wget -P ./examples \
    -N https://cdn.jsdelivr.net/gh/jgm/pandoc/MANUAL.txt

# Github
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-github.html \
    -d ./defaults/html5_github.yml \
    --from=markdown \
    --shift-heading-level-by=0

# Marx
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-marx.html \
    -d ./defaults/html5_marx.yml \
    --from=markdown \
    --shift-heading-level-by=0

# Tufte
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-tufte.html \
    -d ./defaults/html5_tufte.yml \
    --from=markdown \
    --shift-heading-level-by=0

# Eisvogel
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-eisvogel.pdf \
    -d ./defaults/latex_eisvogel.yml \
    --from=markdown \
    --shift-heading-level-by=0

# weasyprint
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-weasyprint.pdf \
    -d ./defaults/pdf_weasyprint.yml \
    --from=markdown \
    --shift-heading-level-by=0

# wkhtmltopdf
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-wkhtmltopdf.pdf \
    -d ./defaults/pdf_wkhtmltopdf.yml \
    --from=markdown \
    --shift-heading-level-by=0

# EPUB
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL.epub \
    -d ./defaults/epub.yml \
    --from=markdown
