# Remove files in examples/
rm examples/*

# Download css stylesheets
aria2c -d css --allow-overwrite https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css
aria2c -d css --allow-overwrite https://raw.githubusercontent.com/mblode/marx/master/css/marx.css
aria2c -d css --allow-overwrite https://raw.githubusercontent.com/edwardtufte/tufte-css/gh-pages/tufte.css
aria2c -d css --allow-overwrite https://raw.githubusercontent.com/edwardtufte/tufte-css/gh-pages/latex.css

# 
sass scss/pdf-article.scss css/pdf-article.css
sass scss/pdf-report.scss  css/pdf-report.css
sass scss/pdf-book.scss  css/pdf-book.css

# Generate HTML templates
pp -D TEMPLATE=github         pp/template.pp.html > templates/github.html
pp -D TEMPLATE=marx           pp/template.pp.html > templates/marx.html
pp -D TEMPLATE=tufte          pp/template.pp.html > templates/tufte.html
pp -D TEMPLATE=github-offline pp/template.pp.html > templates/github-offline.html
pp -D TEMPLATE=marx-offline   pp/template.pp.html > templates/marx-offline.html
pp -D TEMPLATE=tufte-offline  pp/template.pp.html > templates/tufte-offline.html
pp -D TEMPLATE=pdf-article    pp/template.pp.html > templates/pdf-article.html
pp -D TEMPLATE=pdf-report     pp/template.pp.html > templates/pdf-report.html
pp -D TEMPLATE=pdf-book       pp/template.pp.html > templates/pdf-book.html

# Update template tufte-handout.tex
aria2c -d templates --allow-overwrite https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex

# Update template eisvogel.tex
aria2c -d templates --allow-overwrite https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex 

# Update Pandoc MANUAL.txt
aria2c -o examples/MANUAL.md --allow-overwrite https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt
# aria2c -o examples/sample-handout.md --allow-overwrite https://raw.githubusercontent.com/duzyn/tufte-markdown/master/sample-handout.md

# Github
pandoc examples/MANUAL.md -o examples/MANUAL-github.html -f markdown -t html5 -N --toc --template=github.html -V toctitle="Table of Contents"
pandoc examples/MANUAL.md -o examples/MANUAL-github.pdf -f markdown -t html -N --toc --template=github-offline.html -V toctitle="Table of Contents"

# Marx
pandoc examples/MANUAL.md -o examples/MANUAL-marx.html -f markdown -t html5 -N --toc --template=marx.html -V toctitle="Table of Contents"
pandoc examples/MANUAL.md -o examples/MANUAL-marx.pdf -f markdown -t html -N --toc --template=marx-offline.html -V toctitle="Table of Contents"

# PDF Article
pandoc examples/MANUAL.md -o examples/MANUAL-pdf-article.pdf -f markdown -t html --pdf-engine=prince -N --toc --template=pdf-article.html -V toctitle="Table of Contents"

# PDF Report
pandoc examples/MANUAL.md -o examples/MANUAL-pdf-report.pdf -f markdown -t html --pdf-engine=prince -N --toc --template=pdf-report.html -V toctitle="Table of Contents"

# PDF Book
pandoc examples/MANUAL.md -o examples/MANUAL-pdf-book.pdf -f markdown -t html --pdf-engine=prince -N --toc --template=pdf-book.html -V toctitle="Table of Contents"

# Eisvogel
# pandoc examples/MANUAL.md -o examples/MANUAL-eisvogel.pdf -f markdown --pdf-engine=xelatex -N --toc --template=eisvogel.tex -V titlepage=true -V toc-own-page=true

# EPUB
pandoc examples/MANUAL.md -o examples/MANUAL.epub -f markdown -t epub -N --toc -V toctitle="Table of Contents"