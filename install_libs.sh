#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

cd ${SOFTWARE_PATH}
Wget 'http://zlib.net/zlib-1.2.8.tar.gz'
tar xzvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://www.openssl.org/source/openssl-1.0.1i.tar.gz'
tar xzvf openssl-1.0.1i.tar.gz
cd openssl-1.0.1i
./config --prefix=/usr/local/ shared
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://downloads.sourceforge.net/project/levent/libevent/libevent-2.0/libevent-2.0.21-stable.tar.gz'
tar xzvf libevent-2.0.21-stable.tar.gz
cd libevent-2.0.21-stable
mkdir build
cd build
../configure --prefix=/usr/local/ --disable-openssl
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://www.fastcgi.com/dist/fcgi.tar.gz'
tar xzvf fcgi.tar.gz
cd fcgi-2.4.1-SNAP-0311112127/
sed -i '1i#define EOF (-1)' libfcgi/fcgio.cpp
mkdir build
cd build
../configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://download.lighttpd.net/spawn-fcgi/releases-1.6.x/spawn-fcgi-1.6.4.tar.gz'
tar xzvf spawn-fcgi-1.6.4.tar.gz
cd spawn-fcgi-1.6.4
mkdir build
cd build
../configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://curl.haxx.se/download/curl-7.37.1.tar.gz'
tar xzvf curl-7.37.1.tar.gz
cd curl-7.37.1
mkdir build
cd build
../configure --prefix=/usr/local/ --without-ssl --without-libidn --without-zlib
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://mirrors.hust.edu.cn/apache//xerces/c/3/sources/xerces-c-3.1.1.tar.gz'
tar xzvf xerces-c-3.1.1.tar.gz
cd xerces-c-3.1.1
mkdir build
cd build
../configure --prefix=/usr/local/ --disable-network
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://www.cmake.org/files/v3.0/cmake-3.0.1.tar.gz'
tar xzvf cmake-3.0.1.tar.gz
cd cmake-3.0.1
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.1.5-src.tar.gz'
tar xzvf mysql-connector-c-6.1.5-src.tar.gz
cd mysql-connector-c-6.1.5-src
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://downloads.sourceforge.net/project/boost/boost/1.56.0/boost_1_56_0.tar.gz'
tar xzvf boost_1_56_0.tar.gz
cd boost_1_56_0
./bootstrap.sh --prefix=/usr/local
./b2
sudo ./b2 install
sudo ldconfig
