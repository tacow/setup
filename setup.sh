#!/bin/sh

IsOS() {
    n=$(grep -i $1 /etc/issue | wc -l)
    if [ $n -ge 1 ]
    then
        return 0
    else
        return 1
    fi
}

SCRIPT_DIR=$(dirname $0)

if ( IsOS centos || IsOS fedora )
then
    sh ${SCRIPT_DIR}/setup_centos.sh
fi

if IsOS ubuntu
then
    sh ${SCRIPT_DIR}/setup_ubuntu.sh
fi

echo -n "Install softwares now? (y/n) "
read yn
if [ $yn = "y" ]
then
    if ( IsOS centos || IsOS fedora )
    then
        sh ${SCRIPT_DIR}/software_centos.sh
    fi

    if IsOS ubuntu
    then
        sh ${SCRIPT_DIR}/software_ubuntu.sh
    fi
fi

