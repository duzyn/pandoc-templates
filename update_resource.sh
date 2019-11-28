#!/bin/bash

# Update Pandoc MANUAL.txt
aria2c -o MANUAL.md -d examples --allow-overwrite https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt

# Update Eisvogel LaTeX template
aria2c -o eisvogel.latex -d templates --allow-overwrite https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex

# Update Tufte Handout LaTeX template
aria2c -o tufte-handout.latex -d templates --allow-overwrite https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex

# Update Github Markdown CSS
aria2c -d css --allow-overwrite https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css

# Update Marx CSS
aria2c -d css --allow-overwrite https://raw.githubusercontent.com/mblode/marx/master/css/marx.css
