#!/bin/sh
if [ $# -lt 1 ]
then
    echo "$0 <section> [name]"
    exit
fi

if [ $# -ge 2 ]
then
    NAME=$2
    SECTION=$1
else
    NAME=$1
    SECTION=
fi

man -t ${SECTION} ${NAME} | ps2pdf - > ${NAME}.pdf

