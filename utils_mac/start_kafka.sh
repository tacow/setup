#!/bin/sh
BASE_DIR=~/Desktop/Dev/
NOW=`date "+%Y-%m-%d_%H%M%S"`

cd ${BASE_DIR}/kafka_2.13-3.2.0
echo "Starting zookeeper..."
nohup bin/zookeeper-server-start.sh config/zookeeper.properties > ${BASE_DIR}/log/zookeeper_${NOW}.log &

sleep 5

echo "Starting kafka..."
nohup bin/kafka-server-start.sh config/server.properties > ${BASE_DIR}/log/kafka_${NOW}.log &
