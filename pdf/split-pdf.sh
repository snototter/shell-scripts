#!/bin/bash --

# requires pdftk (and poppler-utils??)
#TODO

if [[ $# -eq 2 ]]
then
  pdf=$1
  folder=$2
  pi=$(pdfinfo $pdf)
  numpages=$(echo $pi | grep -Po 'Pages:[ ]*\K[0-9]+')
  echo "PDF $pdf has $numpages pages"

  ## Paper 1
  fn_suffix=("part1" "part2")
  start_pages=(1 17)

  length=${#fn_suffix[@]}
  for (( i=0; i<${length}; i++));
  do
    from=${start_pages[$i]}
    to=$numpages
    if (( $i < ${length}-1 ))
    then
      to=$((${start_pages[$i+1]} - 1))
    fi
    echo "${fn_sufix[$i]} [${from}, ..., ${to}]"
#TODO extract filename!
    pdftk $pdf cat ${from}-${to} output ${folder}/${basename}${fn_suffix[$i]}.pdf
  done
else
  echo "Provide 1) PDF and 2) output directory"
fi
