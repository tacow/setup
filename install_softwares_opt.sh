#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

cd ${SOFTWARE_PATH}
Wget 'http://downloads.sourceforge.net/project/fuse/fuse-2.X/2.9.3/fuse-2.9.3.tar.gz'
tar xzvf fuse-2.9.3.tar.gz
cd fuse-2.9.3
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://tuxera.com/opensource/ntfs-3g_ntfsprogs-2014.2.15.tgz'
tar xzvf ntfs-3g_ntfsprogs-2014.2.15.tgz
cd ntfs-3g_ntfsprogs-2014.2.15
make -j 2
sudo make install
sudo ldconfig
