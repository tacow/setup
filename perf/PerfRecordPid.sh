#!/bin/sh
FREQUENCY=100
CMD_NAME=$(basename $0)

if [ $# -lt 1 ]
then
	    echo "${CMD_NAME} [pid]"
		    exit
fi

perf record --call-graph dwarf -F ${FREQUENCY} -p $1
