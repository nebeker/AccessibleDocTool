#! /bin/bash
name=$(grep -m 1 "title: " title.txt | cut -c8-)
name=${name//" "/"_"}

pandoc title.txt text.md --toc -o out/$name.html
if [[ -f cover.jpg ]]
then
    pandoc title.txt text.md --css=accessible.css --epub-cover-image=cover.jpg --toc -o out/$name.epub
else
    pandoc title.txt text.md --css=accessible.css --toc -o out/$name.epub
fi
pandoc title.txt text.md --toc --pdf-engine=xelatex --variable mainfont=Arial --variable fontsize=14pt -o out/$name.pdf
pandoc title.txt text.md --toc --reference-doc=accessible.docx -o out/$name.docx
