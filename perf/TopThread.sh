#!/bin/sh
CMD_NAME=$(basename $0)

if [ $# -lt 1 ]
then
	    echo "${CMD_NAME} [pid]"
		    exit
fi

top -H -p $1
