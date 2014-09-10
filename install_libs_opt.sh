#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

cd ${SOFTWARE_PATH}
Wget 'http://apache.fayea.com/apache-mirror/thrift/0.9.1/thrift-0.9.1.tar.gz'
tar xzvf thrift-0.9.1.tar.gz
cd thrift-0.9.1
mkdir build
cd build
../configure --prefix=/usr/local/ --with-qt4=no --with-c_glib=no --with-csharp=no --with-java=no --with-erlang=no --with-perl=no --with-php=no --with-php_extension=no --with-ruby=no --with-haskell=no --with-go=no --with-d=no
cd lib
make -j 2
sudo make install
sudo ldconfig
