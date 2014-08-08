#!/bin/bash

THESIS_DIR=/home/kowalski/mythesis/
echo "Entering: "${THESIS_DIR}
cd ${THESIS_DIR}
latex MScTHESIS.tex
latex MScTHESIS.tex
bibtex MScTHESIS
bibtex MScTHESIS
bibtex MScTHESIS
latex MScTHESIS.tex
latex MScTHESIS.tex
latex MScTHESIS.tex

# dvipdf MScTHESIS.dvi MScThesis_v250PRINT.pdf
dvipdf MScTHESIS.dvi MScThesis_devel.pdf
# kpdf MScThesis_devel.pdf &


