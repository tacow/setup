#!/bin/sh
if [ $# -lt 2 ]
then
    echo "rename [old_pattern] [new_pattern]"
    exit
fi

for oldname in *
do
    newname=${oldname//$1/$2}
    if [ "${newname}" != "${oldname}" ]
    then
        mv ${oldname} ${newname}
    fi
done
