#!/bin/bash

rm -rf ./examples/MANUAL-*.*

# Update Pandoc MANUAL.txt
wget -P ./examples \
    -N https://cdn.jsdelivr.net/gh/jgm/pandoc/MANUAL.txt

# Github
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-github.html \
    -d ./defaults/github.yml

# Marx
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-marx.html \
    -d ./defaults/marx.yml

# Tufte
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-tufte.html \
    -d ./defaults/tufte.yml

# Eisvogel
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-eisvogel.pdf \
    -d ./defaults/eisvogel.yml

# weasyprint
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-weasyprint.pdf \
    -d ./defaults/weasyprint.yml

# wkhtmltopdf
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL-wkhtmltopdf.pdf \
    -d ./defaults/wkhtmltopdf.yml

# EPUB
pandoc ./examples/MANUAL.txt \
    -o ./examples/MANUAL.epub \
    -d ./defaults/epub.yml
