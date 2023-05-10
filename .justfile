default: update ctexart ctexrep docx eisvogel epub github latex pagedjs-cli tufte-handout wkhtmltopdf xelatex

update:
    curl -o examples/pandoc-manual.txt \
        https://cdn.jsdelivr.net/gh/jgm/pandoc/MANUAL.txt
    curl -o examples/scoop-cn-readme.md \
        https://cdn.jsdelivr.net/gh/duzyn/scoop-cn/README.md
    curl -o templates/eisvogel.tex \
        https://cdn.jsdelivr.net/gh/Wandmalfarbe/pandoc-latex-template/eisvogel.tex
    curl -o templates/tufte-handout.tex \
        https://cdn.jsdelivr.net/gh/rstudio/tufte/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex

ctexart:  
    pandoc examples/scoop-cn-readme.md -o examples/scoop-cn-readme-ctexart.pdf \
        -d defaults/ctexart.yml

ctexrep:  
    pandoc examples/scoop-cn-readme.md -o examples/scoop-cn-readme-ctexrep.pdf \
        -d defaults/ctexrep.yml

docx:  
    pandoc examples/pandoc-manual.txt -o examples/pandoc-manual.docx \
        -d defaults/docx.yml

eisvogel:
    pandoc examples/pandoc-manual.txt -o examples/pandoc-manual-eisvogel.pdf \
        -d defaults/eisvogel.yml

epub:
    pandoc examples/pandoc-manual.txt -o examples/pandoc-manual.epub

github:  
    pandoc examples/pandoc-manual.txt -o examples/pandoc-manual-github.html \
        -d defaults/github.yml

latex:  
    pandoc examples/pandoc-manual.txt -o examples/pandoc-manual.tex \
        -d defaults/latex.yml

pagedjs-cli:
    pandoc examples/pandoc-manual.txt -o examples/pandoc-manual-pagedjs-cli.pdf \
        -d defaults/pagedjs-cli.yml

tufte-handout:
    pandoc README.md -o examples/README.pdf \
        -d defaults/tufte-handout.yml

wkhtmltopdf:
    pandoc examples/pandoc-manual.txt -o examples/pandoc-manual-wkhtmltopdf.pdf \
        -d defaults/wkhtmltopdf.yml

xelatex:
    pandoc examples/pandoc-manual.txt -o examples/pandoc-manual-xelatex.pdf \
        -d defaults/xelatex.yml
