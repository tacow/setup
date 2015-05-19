#!/bin/sh
SOFTWARE_PATH=~/software

mkdir -p ${SOFTWARE_PATH}

cd ${SOFTWARE_PATH}
wget --no-check-certificate 'https://pypi.python.org/packages/source/p/pip/pip-6.1.1.tar.gz'
tar xzvf pip-6.1.1.tar.gz
cd pip-6.1.1
python setup.py build
sudo python setup.py install

sudo pip install protobuf
sudo pip install pyinstaller
