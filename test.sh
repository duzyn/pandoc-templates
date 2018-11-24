# HTML Github

pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_github.html -f markdown -t html5 -N --toc --template=https://cdn.jsdelivr.net/gh/duzyn/pandoc-templates/templates/github.html

# HTML Marx

pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_marx.html -f markdown -t html5 -N --toc --template=https://cdn.jsdelivr.net/gh/duzyn/pandoc-templates/templates/marx.html

# PDF with wkhtmltopdf

pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_wkhtmltopdf.pdf -f markdown -t html -N --toc --template=https://cdn.jsdelivr.net/gh/duzyn/pandoc-templates/templates/marx.html

# LaTeX

# pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL.tex -f markdown -t latex -s -N --toc

# XeLaTeX PDF

pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_xelatex.pdf -f markdown -V mainfont="Noto Serif" -V sansfont="Noto Sans" -V monofont="Noto Sans Mono" -N --toc -s --pdf-engine=xelatex -V colorlinks=true

# XeLaTeX PDF 中文

pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_xelatex_zh.pdf -f markdown -V include-before="这是 1 句中文，只是为了测试而加入。" -V CJKmainfont="Noto Serif CJK SC" -V mainfont="Noto Serif" -V sansfont="Noto Sans" -V monofont="Noto Sans Mono"  -V documentclass=ctexart -N --toc -s --pdf-engine=xelatex -V colorlinks=true

# EPUB 3

pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_epub3.epub -f markdown -t epub -N --toc

# EPUB 2

pandoc https://github.com/jgm/pandoc/raw/master/MANUAL.txt -o MANUAL_epub2.epub -f markdown -t epub2 -N --toc

# 参考资料：
# - <http://pandoc.org/MANUAL.html>
# - <https://wkhtmltopdf.org/usage/wkhtmltopdf.txt>
