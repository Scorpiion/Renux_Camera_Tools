#!/bin/bash

ffmpeg -r 30/1 -pix_fmt yuyv422 -s 672x496 -f video4linux2 -i /dev/video6 -qscale 1 -f mp4 output.mp4

