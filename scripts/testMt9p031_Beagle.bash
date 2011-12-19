#!/bin/bash

echo ""
echo "Testing mt9p031 camerachip (LI-5M03) on Beagleboard"

echo ""
echo "Reload driver... (needed after reboot)"
su -c "rmmod omap3_isp; modprobe iommu2; modprobe omap3_isp"
su -c "modprobe omap_vout"

echo ""
echo "Give user premissions to use /dev/media0 and /dev/videoX devices"
su -c "chmod 666 /dev/media0"
su -c "chmod 666 /dev/v*"
su -c "chmod 666 /dev/fb*"

echo ""
echo "Setup part 1"
echo "Cmd: media-ctl -v -r -l '\"mt9p031 3-0048\":0->\"OMAP3 ISP CCDC\":0[1], \"OMAP3 ISP CCDC\":1->\"OMAP3 ISP CCDC output\":0[1]'"
echo ""
media-ctl -v -r -l '"mt9p031 3-0048":0->"OMAP3 ISP CCDC":0[1], "OMAP3 ISP CCDC":1->"OMAP3 ISP CCDC output":0[1]'

echo ""
echo "Setup part 2"
echo "Cmd: media-ctl -v -f '\"mt9p031 3-0048\":0[SGRBG12 640x480], \"OMAP3 ISP CCDC\":1[SGRBG12 640x480]'"
echo ""
media-ctl -v -f '"mt9p031 3-0048":0[SGRBG12 640x480], "OMAP3 ISP CCDC":1[SGRBG12 640x480]'

echo ""
echo "Testing to show video with yavta"
yavta -f SGRBG12 -s 640x480 -n 4 --capture=10 --skip 3 -F `media-ctl -e "OMAP3 ISP CCDC output"`



