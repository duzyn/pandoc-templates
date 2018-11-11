# Pandoc Templates

## Usage

Coverter Markdown to HTML with Github theme：

    pandoc FILE -o FILE.html -f markdown -t html5 --template=https://github.com/duzyn/pandoc-templates/raw/master/templates/github.html5

Coverter Markdown to HTML with Marx theme：

    pandoc FILE -o FILE.html -f markdown -t html5 --template=https://github.com/duzyn/pandoc-templates/raw/master/templates/marx.html5

Coverter Markdown to HTML with Tufte theme：

    pandoc FILE -o FILE.html -f markdown -t html5 --template=https://github.com/duzyn/pandoc-templates/raw/master/templates/tufte.html5

Coverter Markdown to PDF with Tufte handout theme：

    pandoc FILE -o FILE.html -f markdown --pdf-engine=xelatex --template=https://github.com/duzyn/pandoc-templates/raw/master/templates/tufte-handout.tex

## Acknowledgements

- [github-markdown-css](https://github.com/sindresorhus/github-markdown-css)
- [Marx](https://github.com/mblode/marx.git)
- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
- [RStudio Tufte Handout](https://rstudio.github.io/tufte/)
- [R Markdown Tufte Style](https://rstudio.github.io/tufte/cn/)
- [RStudio Pandoc template: tufte-handout.tex](https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex)

## License

Released under the MIT license. See [LICENSE](LICENSE).