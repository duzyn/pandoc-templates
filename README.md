# Pandoc Templates

## Usage

Coverter Markdown to HTML with Github theme：

    pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_github.html -f markdown -t html5 --template=https://cdn.jsdelivr.net/gh/duzyn/pandoc-templates/templates/github.html

Coverter Markdown to HTML with Marx theme：

    pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_marx.html -f markdown -t html5 --template=https://cdn.jsdelivr.net/gh/duzyn/pandoc-templates/templates/marx.html

Coverter Markdown to HTML with Tufte theme：

    pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_tufte.html -f markdown -t html5 --template=https://cdn.jsdelivr.net/gh/duzyn/pandoc-templates/templates/tufte.html

Coverter Markdown to PDF with Tufte handout theme：

    pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_tufte.pdf -f markdown --pdf-engine=xelatex --template=https://cdn.jsdelivr.net/gh/duzyn/pandoc-templates/templates/tufte-handout.tex -V documentclass=tufte-handout

## Acknowledgements

- [github-markdown-css](https://github.com/sindresorhus/github-markdown-css)
- [Marx](https://github.com/mblode/marx.git)
- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
- [RStudio Tufte Handout](https://rstudio.github.io/tufte/)
- [R Markdown Tufte Style](https://rstudio.github.io/tufte/cn/)
- [RStudio Pandoc template: tufte-handout.tex](https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex)

## License

Released under the MIT license. See [LICENSE](LICENSE).
