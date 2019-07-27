cd examples

# Update Pandoc MANUAL.txt
aria2c -o MANUAL.md --allow-overwrite https://cdn.jsdelivr.net/gh/jgm/pandoc/MANUAL.txt

# Github
pandoc MANUAL.md -o MANUAL-github.html -f markdown -t html5 -N --toc --template=github.html -V toctitle="Table of Contents"

# Marx
pandoc MANUAL.md -o MANUAL-marx.html -f markdown -t html5 -N --toc --template=marx.html -V toctitle="Table of Contents"

# wkhtmltopdf
pandoc MANUAL.md -o MANUAL-wkhtmltopdf.pdf -f markdown -t html5 -N --toc --template=wkhtmltopdf.html -V toctitle="Table of Contents" -V header-html=../includes/en/header.html

# PDF Article
# pandoc MANUAL.md -o MANUAL-pdf-article.pdf -f markdown -t html --pdf-engine=prince -N --toc --template=pdf-article.html -V toctitle="Table of Contents"

# PDF Report
# pandoc MANUAL.md -o MANUAL-pdf-report.pdf -f markdown -t html --pdf-engine=prince -N --toc --template=pdf-report.html -V toctitle="Table of Contents"

# PDF Book
# pandoc MANUAL.md -o MANUAL-pdf-book.pdf -f markdown -t html --pdf-engine=prince -N --toc --template=pdf-book.html -V toctitle="Table of Contents"

# Eisvogel
# pandoc MANUAL.md -o MANUAL-eisvogel.pdf -f markdown --pdf-engine=xelatex -N --toc --template=eisvogel.tex -V titlepage=true -V toc-own-page=true

# EPUB
# pandoc MANUAL.md -o MANUAL.epub -f markdown -t epub -N --toc -V toctitle="Table of Contents"
