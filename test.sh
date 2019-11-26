#!/bin/bash

# rm -r ./examples/*.*

# Github
pandoc ./examples/MANUAL.md -o ./examples/MANUAL-github.html -d html5_github.yml -d lang_en.yml -d css_pandoc.yml

# Marx
pandoc ./examples/MANUAL.md -o ./examples/MANUAL-marx.html -d html5_marx.yml -d lang_en.yml -d css_pandoc.yml

# wkhtmltopdf
pandoc ./examples/MANUAL.md -o ./examples/MANUAL-wkhtmltopdf.pdf -d html5_github.yml -d lang_en.yml -d css_pandoc.yml -d pdf_article.yml

# Eisvogel
pandoc ./examples/MANUAL.md -o ./examples/MANUAL-eisvogel.pdf -d latex_eisvogel.yml -d lang_en.yml

# EPUB
pandoc ./examples/MANUAL.md -o ./examples/MANUAL.epub -d epub_ebook.yml -d lang_en.yml
