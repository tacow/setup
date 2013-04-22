#!/bin/sh
if [ $# -lt 1 ]
then
    echo "mt_valgrind [program]"
    exit
fi

valgrind --tool=memcheck --leak-check=full $1
