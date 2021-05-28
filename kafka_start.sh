#!/bin/bash

KAFKA_ADVERTISED_LISTENERS="${KAFKA_ADVERTISED_LISTENERS:-PLAINTEXT://kafka:9092}"
sed -iserver.properties.back "s#advertised.listeners=PLAINTEXT://localhost:9092#advertised.listeners=${KAFKA_ADVERTISED_LISTENERS}#g" /opt/kafka/config/kraft/server.properties

kafka-server-start.sh $@
