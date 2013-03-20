#!/bin/sh
result=""
read line
while [ -n "${line}" ]
do
    result="${result} \"${line}\""
    read line
done
echo ${result}
