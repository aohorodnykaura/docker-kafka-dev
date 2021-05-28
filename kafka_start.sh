#!/bin/bash

KAFKA_HOST="${KAFKA_HOST:-kafka}"
KAFKA_ADVERTISED_LISTENERS="${KAFKA_ADVERTISED_LISTENERS:-PLAINTEXT://kafka:9092}"
sed -iserver.properties.back "s#advertised.listeners=PLAINTEXT://localhost:9092#advertised.listeners=${KAFKA_ADVERTISED_LISTENERS}#g" /opt/kafka/config/kraft/server.properties

echo "$(/sbin/ip route | egrep -o '[0-9\.]+' | tail -n1)   ${KAFKA_HOST}" >> /etc/hosts

kafka-server-start.sh $@
