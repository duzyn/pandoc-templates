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
cd "$SCRIPT_DIR" || exit 1

mkdir -p examples templates translations

# Clean
# [[ -f examples/spec.md ]] && rm examples/spec.md
# [[ -f examples/README.md ]] && rm examples/README.md
# [[ -f templates/eisvogel.tex ]] && rm templates/eisvogel.tex
# [[ -f templates/_tufte-handout-origin.tex ]] && rm templates/_tufte-handout-origin.tex

# Update source
# wget -O examples/spec.md https://ghproxy.com/https://raw.githubusercontent.com/commonmark/commonmark-spec/master/spec.txt
wget -O templates/eisvogel.tex https://ghproxy.com/https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex
wget -O templates/_tufte-handout-origin.tex https://ghproxy.com/https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex
wget -O templates/_github-markdown.css https://ghproxy.com/https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css

# epub.css
cp -f templates/_base.css epub.css
cat templates/_pandoc.css >> epub.css

# Translations
pandoc --print-default-data-file=translations/zh-Hans.yaml > translations/zh-CN.yaml
pandoc --print-default-data-file=translations/zh-Hant.yaml > translations/zh-TW.yaml

# Test
# pandoc -o examples/spec.epub examples/spec.md --toc
# pandoc -d defaults/docx.yml -o examples/spec.docx examples/spec.md --toc
# pandoc -d defaults/html5-github.yml -o examples/spec-github.html examples/spec.md --toc
# pandoc -d defaults/latex.yml -o examples/spec.tex examples/spec.md --toc
# # pandoc -d defaults/pdf-eisvogel.yml -o examples/spec-eisvogel.pdf examples/spec.md --toc -M titlepage=true
# pandoc -d defaults/pdf-pagedjs-cli.yml -o examples/spec-pagedjs-cli.pdf examples/spec.md --toc
# pandoc -d defaults/pdf-wkhtmltopdf.yml -o examples/spec-wkhtmltopdf.pdf examples/spec.md --toc
# pandoc -d defaults/pdf-xelatex.yml -o examples/spec-xelatex.pdf examples/spec.md --toc
# # pandoc -d defaults/pdf-typst.yml           -o examples/spec-typst.pdf         examples/spec.md --toc
# pandoc -d defaults/pdf-weasyprint.yml -o examples/spec-weasyprint.pdf examples/spec.md --toc

# Test Chinese
pandoc --metadata-file=metadata.yml --metadata-file=metadata1.yml -d defaults/pdf-eisvogel.yml -o examples/README-eisvogel.pdf README.md
pandoc --metadata-file=metadata.yml --metadata-file=metadata1.yml -d defaults/pdf-tufte-handout.yml -o examples/README-tufte-handout.pdf README.md
pandoc --metadata-file=metadata.yml --metadata-file=metadata1.yml -d defaults/pdf-xelatex.yml -o examples/README-xelatex.pdf README.md
pandoc --metadata-file=metadata.yml --metadata-file=metadata2.yml -d defaults/pdf-wkhtmltopdf.yml -o examples/README-wkhtmltopdf.pdf README.md
pandoc --metadata-file=metadata.yml -d defaults/docx.yml -o examples/README.docx README.md
pandoc --metadata-file=metadata.yml -d defaults/html5-github.yml -o examples/README-github.html README.md
pandoc --metadata-file=metadata.yml -d defaults/latex.yml -o examples/README.tex README.md
pandoc --metadata-file=metadata.yml -d defaults/pdf-ctexart.yml -o examples/README-ctexart.pdf README.md
pandoc --metadata-file=metadata.yml -d defaults/pdf-ctexrep.yml -o examples/README-ctexrep.pdf README.md
pandoc --metadata-file=metadata.yml -d defaults/pdf-pagedjs-cli.yml -o examples/README-pagedjs-cli.pdf README.md
pandoc --metadata-file=metadata.yml -d defaults/pdf-typst.yml -o examples/README-typst.pdf README.md
pandoc --metadata-file=metadata.yml -d defaults/pdf-weasyprint.yml -o examples/README-weasyprint.pdf README.md
