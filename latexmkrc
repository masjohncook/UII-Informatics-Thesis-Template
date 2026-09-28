# Overleaf/local build configuration: pdfLaTeX + BibTeX
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex = 'bibtex %O %B';
$max_repeat = 5;
