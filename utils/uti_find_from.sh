#!/bin/bash
if [ $# -lt 1 ]
then
    echo "find_from.sh [what] (extension) (where)"
    exit
fi

WHAT=$1
if [ $# -lt 2 ]
then
    EXT=
else
    EXT=$2
fi
if [ $# -lt 3 ]
then
    WHERE=.
else
    WHERE=$3
fi

if [ -z ${EXT} ]
then
    find ${WHERE} \( -name "*.h" -or -name "*.c" -or -name "*.cpp" \) -exec grep -Hn ${WHAT} {} \;
else
    find ${WHERE} -name "*.${EXT}" -exec grep -Hn ${WHAT} {} \;
fi
