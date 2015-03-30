#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

cd ${SOFTWARE_PATH}
Wget 'ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2'
tar xjvf gmp-4.3.2.tar.bz2
cd gmp-4.3.2
./configure --prefix=/usr/local/gcc/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2'
tar xjvf mpfr-2.4.2.tar.bz2
cd mpfr-2.4.2
./configure --prefix=/usr/local/gcc/ --with-gmp=/usr/local/gcc/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz'
tar xzvf mpc-0.8.1.tar.gz
cd mpc-0.8.1
./configure --prefix=/usr/local/gcc/ --with-gmp=/usr/local/gcc/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-4.9.2/gcc-4.9.2.tar.gz'
tar xzvf gcc-4.9.2.tar.gz
cd gcc-4.9.2
./configure --prefix=/usr/local/gcc/ --with-gmp=/usr/local/gcc/ --with-mpfr=/usr/local/gcc/ --with-mpc=/usr/local/gcc/ --disable-multilib
make -j 2
sudo make install

