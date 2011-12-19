#!/bin/bash

if [ $# -lt 2 ] ; then
  echo "Usage: $0 pathToKernelHeaders pathToFilesystemToInstallFileTo"
  exit 1
fi

if [ ! -d "$2" ] ; then
  echo "Directory \"$2\" does not exist..."
  exit 1
fi

echo ""
echo "Build media-ctl"
cd media-ctl
autoreconf --install
mkdir -p localInstall/etc/ld.so.conf.d
mkdir -p localInstall/usr/local/
./configure --prefix=$PWD/localInstall/usr/local/ --host=arm-linux-gnueabi --with-kernel-headers=$1
make 
make install
echo "/lib" > localInstall/etc/ld.so.conf.d/media-ctl
cd localInstall
tar -czf ../media-ctl-package.tar.gz *
cd ..
mv media-ctl-package.tar.gz ..
cd ..

echo ""
echo "Build yavta"
cd yavta
make CROSS_COMPILE=arm-linux-gnueabi-
mkdir -p usr/local/bin/
mv yavta usr/local/bin/
tar -czf yavta-package.tar.gz usr/local/bin/*
mv yavta-package.tar.gz ..
cd ..

echo 
echo "Build devmem2"
cd devmem2
make 
mkdir -p usr/local/bin/
mv devmem2 usr/local/bin/
tar -czf devmem2-package.tar.gz usr/local/bin/*
mv devmem2-package.tar.gz ..
cd ..

echo ""
echo "Done compiling packages"

echo ""
echo "Installing files to filesystem..."
if [ ! -d "$2/usr/local/bin/" ] ; then
  sudo mkdir -p $2/usr/local/bin/
fi
sudo cp scripts/* $2/usr/local/bin/
sudo tar -zxvf media-ctl-package.tar.gz -C $2
sudo tar -zxvf yavta-package.tar.gz -C $2
sudo tar -zxvf devmem2-package.tar.gz -C $2

