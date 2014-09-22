#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

cd ${SOFTWARE_PATH}
Wget 'http://nginx.org/download/nginx-1.6.2.tar.gz'
cd nginx-1.6.2
./configure
make -j 2
sudo make install
