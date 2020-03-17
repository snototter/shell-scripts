#!/bin/bash --
# Rename all files to %04d.png to ensure a consistent/sequential naming schema
echo "Renaming all files in the current folder!"
a=1
for f in *.png; do
  new=$(printf "%04d.png" "$a") #04 pad to length of 4
  mv -i -- "$f" "$new"
  let a=a+1
done
