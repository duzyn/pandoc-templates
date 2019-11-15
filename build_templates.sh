cd templates

pp -html -DTHEME=github _base.html >github.html
pp -html -DTHEME=marx _base.html >marx.html
pp -html -DTHEME=wkhtmltopdf _base.html >wkhtmltopdf.html

cd ..