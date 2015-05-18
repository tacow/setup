#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

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
Wget 'https://pypi.python.org/packages/source/P/PyInstaller/PyInstaller-2.1.tar.gz'
tar xzvf PyInstaller-2.1.tar.gz
cd PyInstaller-2.1
python setup.py build
sudo python setup.py install
