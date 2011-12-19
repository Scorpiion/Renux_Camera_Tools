#!/bin/bash

ffplay -pix_fmt yuyv422 -s 672x496 -f video4linux2 /dev/video6 

