#!/bin/sh

SCRIPT_DIR=$(dirname $0)

echo "OS type[1]:"
echo "1: Redhat"
echo "2: Ubuntu"
read osType
if [ -z $osType ]
then
    osType=1
fi

sh ${SCRIPT_DIR}/setup_common.sh

if [ $osType -eq 1 ]
then
    sh ${SCRIPT_DIR}/setup_centos.sh
fi

if [ $osType -eq 2 ]
then
    sh ${SCRIPT_DIR}/setup_ubuntu.sh
fi

echo -n "Install softwares now[y]: "
read install
if [ -z $install ]
then
    install="y"
fi

if [ $install = "y" ]
then
    if [ $osType -eq 1 ]
    then
        sh ${SCRIPT_DIR}/software_centos.sh
    fi

    if [ $osType -eq 2 ]
    then
        sh ${SCRIPT_DIR}/software_ubuntu.sh
    fi
fi

