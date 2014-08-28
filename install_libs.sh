#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

cd ${SOFTWARE_PATH}
Wget 'http://curl.haxx.se/download/curl-7.37.1.tar.gz'
tar xzvf curl-7.37.1.tar.gz
cd curl-7.37.1
mkdir build
cd build
../configure --prefix=/usr/local/ --without-ssl --without-libidn --without-zlib
make -j 2
sudo make install

cd ${SOFTWARE_PATH}
Wget 'http://mirrors.hust.edu.cn/apache//xerces/c/3/sources/xerces-c-3.1.1.tar.gz'
tar xzvf xerces-c-3.1.1.tar.gz
cd xerces-c-3.1.1
mkdir build
cd build
../configure --prefix=/usr/local/ --disable-network
make -j 2
sudo make install

cd ${SOFTWARE_PATH}
Wget 'http://downloads.sourceforge.net/project/boost/boost/1.56.0/boost_1_56_0.tar.gz'
tar xzvf boost_1_56_0.tar.gz
cd boost_1_56_0
./bootstrap.sh --prefix=/usr/local
./b2
sudo ./b2 install
