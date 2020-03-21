#!/bin/bash --
# Merge all pdfs into a single output.pdf

pdfunite *.pdf output.pdf

# Page ranges, etc. can be combined with pdftk (cat)
