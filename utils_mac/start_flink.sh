#!/bin/sh
BASE_DIR=~/Desktop/Dev/
NOW=`date "+%Y-%m-%d_%H%M%S"`

cd ${BASE_DIR}/flink-1.15.0
echo "Starting flink..."
nohup bash bin/start-cluster.sh > ${BASE_DIR}/log/flink_${NOW}.log &
