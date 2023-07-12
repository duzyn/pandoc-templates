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
[[ -f ./examples/MANUAL.txt ]]         && rm ./examples/MANUAL.txt
[[ -f ./examples/README.md ]]          && rm ./examples/README.md
[[ -f ./templates/eisvogel.tex ]]      && rm ./templates/eisvogel.tex
[[ -f ./templates/tufte-handout.tex ]] && rm ./templates/tufte-handout.tex

# # Update source
cp -f ./README.md ./examples
wget -P ./examples  https://ghproxy.com/https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt
wget -P ./templates https://ghproxy.com/https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex
wget -P ./templates https://ghproxy.com/https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex

# Test
pandoc                               -o ./examples/pandoc-manual.epub              ./examples/MANUAL.txt --toc
pandoc -d defaults/docx.yml          -o ./examples/pandoc-manual.docx              ./examples/MANUAL.txt --toc 
pandoc -d defaults/eisvogel.yml      -o ./examples/pandoc-manual-eisvogel.pdf      ./examples/MANUAL.txt --toc -M titlepage=true
pandoc -d defaults/github.yml        -o ./examples/pandoc-manual-github.html       ./examples/MANUAL.txt --toc  
pandoc -d defaults/latex.yml         -o ./examples/pandoc-manual.tex               ./examples/MANUAL.txt --toc 
pandoc -d defaults/pagedjs-cli.yml   -o ./examples/pandoc-manual-pagedjs-cli.pdf   ./examples/MANUAL.txt --toc 
pandoc -d defaults/wkhtmltopdf.yml   -o ./examples/pandoc-manual-wkhtmltopdf.pdf   ./examples/MANUAL.txt --toc 
pandoc -d defaults/xelatex.yml       -o ./examples/pandoc-manual-xelatex.pdf       ./examples/MANUAL.txt --toc 

# Test Chinese
pandoc -d defaults/ctexart.yml       -o ./examples/readme-ctexart.pdf       ./examples/README.md
pandoc -d defaults/ctexrep.yml       -o ./examples/readme-ctexrep.pdf       ./examples/README.md
pandoc -d defaults/docx.yml          -o ./examples/readme.docx              ./examples/README.md
pandoc -d defaults/eisvogel.yml      -o ./examples/readme-eisvogel.pdf      ./examples/README.md
pandoc -d defaults/github.yml        -o ./examples/readme-github.html       ./examples/README.md
pandoc -d defaults/latex.yml         -o ./examples/readme.tex               ./examples/README.md
pandoc -d defaults/pagedjs-cli.yml   -o ./examples/readme-pagedjs-cli.pdf   ./examples/README.md
pandoc -d defaults/tufte-handout.yml -o ./examples/readme-tufte-handout.pdf ./examples/README.md
pandoc -d defaults/wkhtmltopdf.yml   -o ./examples/readme-wkhtmltopdf.pdf   ./examples/README.md
pandoc -d defaults/xelatex.yml       -o ./examples/readme-xelatex.pdf       ./examples/README.md
