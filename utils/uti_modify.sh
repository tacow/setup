#!/bin/sh
if [ $# -lt 2 ]
then
    echo "modify.sh [pattern] [destination] (files)"
    exit
fi
if [ $# -gt 2 ]
then
    pattern="$1"
    destination="$2"
    shift
    shift
    sed -i "s/${pattern}/${destination}/g" $*
else
    sed -i "s/$1/$2/g" *
fi
