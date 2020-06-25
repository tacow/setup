#!/bin/sh
CMD_NAME=$(basename $0)

if [ $# -lt 1 ]
then
	    echo "${CMD_NAME} [SVG filename]"
		    exit
fi

SVG_FILE=$1
perf script | stackcolllapse-perf.pl | flamegraph.pl > ${SVG_FILE}
