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
Wget 'http://downloads.sourceforge.net/project/pcre/pcre/8.36/pcre-8.36.tar.gz'
tar xzvf pcre-8.36.tar.gz
cd pcre-8.36
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

#cd ${SOFTWARE_PATH}
#Wget 'http://downloads.sourceforge.net/project/levent/libevent/libevent-2.0/libevent-2.0.21-stable.tar.gz'
#tar xzvf libevent-2.0.21-stable.tar.gz
#cd libevent-2.0.21-stable
#mkdir build
#cd build
#../configure --prefix=/usr/local/ --disable-openssl
#make -j 2
#sudo make install
#sudo ldconfig

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
Wget 'http://mirror.bit.edu.cn/apache//xerces/c/3/sources/xerces-c-3.1.2.tar.gz'
tar xzvf xerces-c-3.1.2.tar.gz
cd xerces-c-3.1.2
mkdir build
cd build
../configure --prefix=/usr/local/ --disable-network
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://mitab.maptools.org/dl/mitab-1.7.0.tar.gz'
tar xzvf mitab-1.7.0.tar.gz
cd mitab-1.7.0
make
sudo cp mitab/tab2tab /usr/local/bin/
sudo cp mitab/tabdump /usr/local/bin/

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
Wget 'http://download.savannah.gnu.org/releases/libunwind/libunwind-1.1.tar.gz'
tar xzvf libunwind-1.1.tar.gz
cd libunwind-1.1
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://downloads.sourceforge.net/project/gperftools.mirror/gperftools-2.1.tar.gz'
tar xzvf gperftools-2.1.tar.gz
cd gperftools-2.1
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://downloads.sourceforge.net/project/protobuf/protobuf-2.6.0.tar.gz'
tar xzvf protobuf-2.6.0.tar.gz
cd protobuf-2.6.0
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://downloads.sourceforge.net/project/jsoncpp/jsoncpp/0.5.0/jsoncpp-src-0.5.0.tar.gz'
tar xzvf jsoncpp-src-0.5.0.tar.gz
cd jsoncpp-src-0.5.0
scons platform=linux-gcc
sudo cp -r include/json/ /usr/local/include/
sudo cp libs/linux-gcc-4.4.7/* /usr/local/lib/
sudo ldconfig
