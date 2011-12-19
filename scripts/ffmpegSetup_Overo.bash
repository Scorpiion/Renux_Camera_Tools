#!/bin/bash

media-ctl -r
media-ctl -l '"mt9p031 2-0048":0->"OMAP3 ISP CCDC":0[1]'
media-ctl -l '"OMAP3 ISP CCDC":2->"OMAP3 ISP preview":0[1]'
media-ctl -l '"OMAP3 ISP preview":1->"OMAP3 ISP resizer":0[1]'
media-ctl -l '"OMAP3 ISP resizer":1->"OMAP3 ISP resizer output":0[1]'

media-ctl -f '"mt9p031 2-0048":0 [SGRBG12 2592x1944]'
media-ctl -f '"OMAP3 ISP CCDC":0 [SGRBG12 2592x1944]'
media-ctl -f '"OMAP3 ISP CCDC":1 [SGRBG10 2592x1944]'
media-ctl -f '"OMAP3 ISP preview":0 [SGRBG10 2592x1943]'
media-ctl -f '"OMAP3 ISP resizer":0 [YUYV 2574x1935]'
media-ctl -f '"OMAP3 ISP resizer":1 [YUYV 672x496]'


