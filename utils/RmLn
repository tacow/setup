TEMP_FILE=/tmp/rm_line.tmp

if [ $# -lt 1 ]
then
    echo rm_line [pattern]
    exit
fi

for file in *
do
    grep -v $1 ${file} > ${TEMP_FILE}
    cp ${TEMP_FILE} ${file}
done
