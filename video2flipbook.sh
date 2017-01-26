#!/bin/bash
# downloads a video, then makes a flipbook out of it

VIDEO_URL=${1}
FLIPBOOK_NAME=${2}
mkdir -p ${FLIPBOOK_NAME}
youtube-dl ${VIDEO_URL} -f 18 --output ${FLIPBOOK_NAME}/${FLIPBOOK_NAME}.mp4
ffmpeg -i ${FLIPBOOK_NAME}/${FLIPBOOK_NAME}.mp4 ${FLIPBOOK_NAME}/${FLIPBOOK_NAME}-frame%06d.png
montage ${FLIPBOOK_NAME}/${FLIPBOOK_NAME}-frame*.png -tile 2x4 -geometry +200+1 ${FLIPBOOK_NAME}/${FLIPBOOK_NAME}-page%06d.png
rm ${FLIPBOOK_NAME}/${FLIPBOOK_NAME}.mp4 ${FLIPBOOK_NAME}/${FLIPBOOK_NAME}-frame*.png
echo "$( ls ${FLIPBOOK_NAME}/${FLIPBOOK_NAME}-page*.png | wc -l ) pages generated in ${FLIPBOOK_NAME}/"
