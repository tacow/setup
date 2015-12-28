#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

#cd ${SOFTWARE_PATH}
#Wget 'http://mirrors.cnnic.cn/apache/thrift/0.9.2/thrift-0.9.2.tar.gz'
#tar xzvf thrift-0.9.2.tar.gz
#cd thrift-0.9.2
#./configure --prefix=/usr/local/ --with-qt4=no --with-c_glib=no --with-csharp=no --with-java=no --with-erlang=no --with-perl=no --with-php=no --with-php_extension=no --with-ruby=no --with-haskell=no --with-go=no --with-d=no
#cd lib
#make -j 2
#sudo make install
#sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://www.openssl.org/source/openssl-1.0.1i.tar.gz'
tar xzvf openssl-1.0.1i.tar.gz
cd openssl-1.0.1i
./config --prefix=/usr/local/ shared
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://mirror.bit.edu.cn/apache//apr/apr-1.5.2.tar.gz'
tar xzvf apr-1.5.2.tar.gz
cd apr-1.5.2
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://mirror.bit.edu.cn/apache/activemq/activemq-cpp/3.8.3/activemq-cpp-library-3.8.3-src.tar.gz'
tar xzvf activemq-cpp-library-3.8.3-src.tar.gz
cd activemq-cpp-library-3.8.3
./configure --prefix=/usr/local/
make -j 2
sudo make install
sudo ldconfig

cd ${SOFTWARE_PATH}
Wget 'http://downloads.sourceforge.net/project/boost/boost/1.58.0/boost_1_58_0.tar.gz'
tar xzvf boost_1_58_0.tar.gz
cd boost_1_58_0
./bootstrap.sh --prefix=/usr/local
./b2
sudo ./b2 install
sudo ldconfig
