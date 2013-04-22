#!/bin/sh
if [ $# -lt 2 ]
then
    echo "$0 [from charset] [to charset] [files]"
    exit
fi

FCHARSET=$1
shift
TCHARSET=$1
shift

for FILE in $@
do
    iconv -f ${FCHARSET} -t ${TCHARSET} ${FILE} > /tmp/iconv.tmp
    cp /tmp/iconv.tmp ${FILE}
done

