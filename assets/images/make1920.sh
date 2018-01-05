#!/bin/bash


filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"

gm convert -resize 1920x $1 -profile sRGB_v4_ICC_preference.icc ${filename}1920x.jpg

