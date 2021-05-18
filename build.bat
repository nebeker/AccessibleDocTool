findstr /B title: title.txt > tmp
set /p name= < tmp
del tmp
rem remove "title: "
set name=%name:~7%
rem replace spaces with underscores
set name=%name: =_%

pandoc.exe title.txt text.md --toc -o out\%name%.html
if exist cover.jpg (
    pandoc.exe title.txt text.md --toc --css=accessible.css --epub-cover-image=cover.jpg -o out\%name%.epub
) else (
    pandoc.exe title.txt text.md --toc --css=accessible.css -o out\%name%.epub
)
pandoc.exe title.txt text.md --toc --pdf-engine=xelatex --variable mainfont=Arial --variable fontsize=14pt -o out\%name%.pdf
pandoc.exe title.txt text.md --toc --reference-doc=accessible.docx -o out\%name%.docx
