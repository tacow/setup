#!/bin/sh
if [ $# -lt 1 ]
then
    echo "uti_openport [port] <protocol>"
    echo "protocol: \"tcp\" or \"udp\", default is \"tcp\""
    exit
fi

PROTOCOL=tcp
if [ $# -ge 2 ]
then
    PROTOCOL=$2
fi

sudo iptables -I INPUT -p ${PROTOCOL} --dport $1 -j ACCEPT
