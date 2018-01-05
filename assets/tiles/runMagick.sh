#!/bin/bash


filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"

gm convert $1 -profile sRGB_v4_ICC_preference.icc ${filename}.jpg


./magick-slicer.sh ${filename}.jpg ${filename}
