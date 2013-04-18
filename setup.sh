#!/bin/sh

IsOS() {
    n=$(grep $1 /etc/issue | wc -l)
    if [ $n -ge 1 ]
    then
        return 0
    else
        return 1
    fi
}

if IsOS CentOS
then
    sh setup_centos.sh
fi

if IsOS Ubuntu
then
    sh setup_ubuntu.sh
fi

echo -n "Install softwares now? (y/n) "
read yn
if [ $yn = "y" ]
then
    if IsOS CentOS
    then
        sh software_centos.sh
    fi

    if IsOS Ubuntu
    then
        sh software_ubuntu.sh
    fi
fi

