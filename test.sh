# Remove files in examples/
rm examples/*

# Download css stylesheets
aria2c -d css --allow-overwrite https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css
aria2c -d css --allow-overwrite https://cdnjs.cloudflare.com/ajax/libs/marx/3.0.7/marx.min.css
aria2c -d css --allow-overwrite https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.4/tufte.min.css
aria2c -d css --allow-overwrite https://cdn.staticaly.com/gh/edwardtufte/tufte-css/v1.4/latex.css

# Generate HTML templates
pp -D TEMPLATE=github pp/template.pp.html > templates/github.html
pp -D TEMPLATE=marx   pp/template.pp.html > templates/marx.html
pp -D TEMPLATE=tufte  pp/template.pp.html > templates/tufte.html

# Update template tufte-handout.tex
aria2c -d templates --allow-overwrite https://cdn.staticaly.com/gh/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex

# Update template eisvogel.tex
aria2c -d templates --allow-overwrite https://cdn.staticaly.com/gh/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex 

# Update Pandoc MANUAL.txt
aria2c -o examples/MANUAL.md --allow-overwrite https://cdn.staticaly.com/gh/jgm/pandoc/master/MANUAL.txt

# Github
pandoc examples/MANUAL.md -o examples/MANUAL-github.html -f markdown -t html5 -N --toc --template=github.html
pandoc examples/MANUAL.md -o examples/MANUAL-github.pdf -f markdown -t html -N --toc --template=github.html -V header-html=header.html -V footer-html=footer.html

# Marx
pandoc examples/MANUAL.md -o examples/MANUAL-marx.html -f markdown -t html5 -N --toc --template=marx.html
pandoc examples/MANUAL.md -o examples/MANUAL-marx.pdf -f markdown -t html -N --toc --template=marx.html -V header-html=header.html -V footer-html=footer.html

# Tufte Handout
# pandoc examples/MANUAL.md -o examples/MANUAL-tufte-handout.pdf -f markdown --pdf-engine=lxelatex -N --toc --template=tufte-handout.tex

# Eisvogel
pandoc examples/MANUAL.md -o examples/MANUAL-eisvogel.pdf -f markdown --pdf-engine=xelatex -N --toc --template=eisvogel.tex -V titlepage=true -V toc-own-page=true

# EPUB
pandoc examples/MANUAL.md -o examples/MANUAL.epub -f markdown -t epub -N --toc