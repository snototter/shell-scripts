## Extract pages
pdftk presentation.pdf cat 6 12 16-17 output samples.pdf
# Concatenate pdfs
pdftk in1.pdf in2.pdf cat output out1.pdf
pdftk A=in1.pdf B=in2.pdf cat A B output out1.pdf
# Collate
pdftk A=even.pdf B=odd.pdf shuffle A B output collated.pdf
# Remove page 3
pdftk in.pdf cat 1-2 4-end output out1.pdf

## Rearrange pages
pdfnup --nup 2x2 slides.pdf
pdfnup --nup 2x1 paper.pdf

## Rotate
pdf90 slides.pdf
pdf180
pdf270

