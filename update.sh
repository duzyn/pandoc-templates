#!/usr/bin/env bash

# A simple script to setup up a new Ubuntu (22.04+) or Debian (12+) installation.
# Inspired by https://github.com/trxcllnt/ubuntu-setup/

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump | gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default.
: "${DEBUG:="false"}"
if [[ "$DEBUG" == "true" ]]; then
    set -o xtrace
fi

SCRIPT_DIR="$(dirname "$(readlink -f "${0}")")"
mkdir -p "$SCRIPT_DIR/examples" "$SCRIPT_DIR/templates"

cd "$SCRIPT_DIR" || exit 1

# Clean
[[ -f ./examples/pandoc-manual.md ]]          && rm ./examples/pandoc-manual.md
[[ -f ./examples/README.md ]]                 && rm ./examples/README.md
[[ -f ./templates/eisvogel.tex ]]             && rm ./templates/eisvogel.tex
[[ -f ./templates/tufte-handout-origin.tex ]] && rm ./templates/tufte-handout-origin.tex

# Update source
wget -O ./examples/pandoc-manual.md          https://ghproxy.com/https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt
wget -O ./templates/eisvogel.tex             https://ghproxy.com/https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex
wget -O ./templates/tufte-handout-origin.tex https://ghproxy.com/https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex
wget -O ./templates/github-markdown.css      https://ghproxy.com/https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css

# epub.css
cat ./templates/base.css   >  ./epub.css
cat ./templates/pandoc.css >> ./epub.css

# Translations
pandoc --print-default-data-file=translations/zh-Hans.yaml > translations/zh-CN.yaml
pandoc --print-default-data-file=translations/zh-Hant.yaml > translations/zh-TW.yaml

# Test
pandoc                                     -o ./examples/pandoc-manual.epub              ./examples/pandoc-manual.md --toc
pandoc -d defaults/docx.yml                -o ./examples/pandoc-manual.docx              ./examples/pandoc-manual.md --toc 
pandoc -d defaults/html5_github.yml        -o ./examples/pandoc-manual-github.html       ./examples/pandoc-manual.md --toc  
pandoc -d defaults/latex.yml               -o ./examples/pandoc-manual.tex               ./examples/pandoc-manual.md --toc 
pandoc -d defaults/pdf_eisvogel.yml        -o ./examples/pandoc-manual-eisvogel.pdf      ./examples/pandoc-manual.md --toc -M titlepage=true
pandoc -d defaults/pdf_pagedjs-cli.yml     -o ./examples/pandoc-manual-pagedjs-cli.pdf   ./examples/pandoc-manual.md --toc 
pandoc -d defaults/pdf_wkhtmltopdf.yml     -o ./examples/pandoc-manual-wkhtmltopdf.pdf   ./examples/pandoc-manual.md --toc 
pandoc -d defaults/pdf_xelatex.yml         -o ./examples/pandoc-manual-xelatex.pdf       ./examples/pandoc-manual.md --toc 
# pandoc -d defaults/pdf_typst.yml           -o ./examples/pandoc-manual-typst.pdf         ./examples/pandoc-manual.md --toc
pandoc -d defaults/pdf_weasyprint.yml      -o ./examples/pandoc-manual-weasyprint.pdf    ./examples/pandoc-manual.md --toc

# Test Chinese
pandoc -d defaults/docx.yml                -o ./examples/README.docx              ./README.md
pandoc -d defaults/html5_github.yml        -o ./examples/README-github.html       ./README.md
pandoc -d defaults/latex.yml               -o ./examples/README.tex               ./README.md
pandoc -d defaults/pdf_ctexart.yml         -o ./examples/README-ctexart.pdf       ./README.md
pandoc -d defaults/pdf_ctexrep.yml         -o ./examples/README-ctexrep.pdf       ./README.md
pandoc -d defaults/pdf_eisvogel.yml        -o ./examples/README-eisvogel.pdf      ./README.md
pandoc -d defaults/pdf_pagedjs-cli.yml     -o ./examples/README-pagedjs-cli.pdf   ./README.md
pandoc -d defaults/pdf_tufte-handout.yml   -o ./examples/README-tufte-handout.pdf ./README.md
pandoc -d defaults/pdf_typst.yml           -o ./examples/README-typst.pdf         ./README.md
pandoc -d defaults/pdf_weasyprint.yml      -o ./examples/README-weasyprint.pdf    ./README.md
pandoc -d defaults/pdf_wkhtmltopdf.yml     -o ./examples/README-wkhtmltopdf.pdf   ./README.md
pandoc -d defaults/pdf_xelatex.yml         -o ./examples/README-xelatex.pdf       ./README.md
