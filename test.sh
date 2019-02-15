# Remove files in examples/
rm examples/*

# Update Pandoc MANUAL.txt
aria2c https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt -o examples/MANUAL.md --allow-overwrite

# Update eisvogel.tex
aria2c https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex -o templates/eisvogel.tex --allow-overwrite

# Github
pandoc examples/MANUAL.md -o examples/MANUAL-github.html -f markdown -t html5 -N --toc --template=github.html
pandoc examples/MANUAL.md -o examples/MANUAL-github.pdf -f markdown --pdf-engine=wkhtmltopdf -N --toc --template=github.html -V header-html=header.html -V footer-html=footer.html

# Marx
pandoc examples/MANUAL.md -o examples/MANUAL-marx.html -f markdown -t html5 -N --toc --template=marx.html
pandoc examples/MANUAL.md -o examples/MANUAL-marx.pdf -f markdown --pdf-engine=wkhtmltopdf -N --toc --template=marx.html -V header-html=header.html -V footer-html=footer.html

# Eisvogel
pandoc examples/MANUAL.md -o examples/MANUAL-eisvogel.pdf -f markdown --pdf-engine=xelatex -N --toc --template=eisvogel.tex -V titlepage=true -V toc-own-page=true

# EPUB
pandoc examples/MANUAL.md -o examples/MANUAL.epub -f markdown -t epub -N --toc