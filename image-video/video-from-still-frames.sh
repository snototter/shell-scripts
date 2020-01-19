#!/bin/bash --

#TODO input: folder, filename ?

# Concatenate RGB and Flow:
# > convert $rgb $flo -append $tmpout

ffmpeg -r $inputfps -i $tmpfolder/frame-%06d.jpg -c:v libx264 -vf fps=$outputfps $vidname
