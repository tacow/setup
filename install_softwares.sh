#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

cd ${SOFTWARE_PATH}
Wget 'ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2'
tar xjvf gmp-4.3.2.tar.bz2
cd gmp-4.3.2
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2'
tar xjvf mpfr-2.4.2.tar.bz2
cd mpfr-2.4.2
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz'
tar xzvf mpc-0.8.1.tar.gz
cd mpc-0.8.1
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://gcc.petsads.us/releases/gcc-4.9.2/gcc-4.9.2.tar.gz'
tar xzvf gcc-4.9.2.tar.gz
cd gcc-4.9.2
./configure --prefix=/usr/local/gcc/
make -j 2
sudo make install

cd ${SOFTWARE_PATH}
Wget 'http://nginx.org/download/nginx-1.6.2.tar.gz'
tar xzvf nginx-1.6.2.tar.gz
cd nginx-1.6.2
./configure
make -j 2
sudo make install

cd ${SOFTWARE_PATH}
Wget 'http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.21.tar.gz'
tar xzvf mysql-5.6.21.tar.gz
cd mysql-5.6.21
cmake .
make -j 2
sudo make install

cd ${SOFTWARE_PATH}
Wget 'http://downloads.sourceforge.net/project/aria2/stable/aria2-1.18.8/aria2-1.18.8.tar.gz'
tar xzvf aria2-1.18.8.tar.gz
cd aria2-1.18.8
./configure --prefix=/usr/local/
make -j 2
sudo make install
