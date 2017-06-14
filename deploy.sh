#!/bin/bash
source ./VERSIONS

docker tag wizzie-kc:${KAFKA_CONNECT_VERSION} gcr.io/wizzie-registry/wizzie-kc:latest
docker tag wizzie-kc:${KAFKA_CONNECT_VERSION} gcr.io/wizzie-registry/wizzie-kc:${KAFKA_CONNECT_VERSION}
gcloud docker -- push gcr.io/wizzie-registry/wizzie-kc:${KAFKA_CONNECT_VERSION}
gcloud docker -- push gcr.io/wizzie-registry/wizzie-kc:latest

docker tag kafka-connect-cli:${KAFKA_CONNECT_CLI_VERSION} gcr.io/wizzie-registry/kafka-connect-cli:latest
docker tag kafka-connect-cli:${KAFKA_CONNECT_CLI_VERSION} gcr.io/wizzie-registry/kafka-connect-cli:${KAFKA_CONNECT_CLI_VERSION}
gcloud docker -- push gcr.io/wizzie-registry/kafka-connect-cli:${KAFKA_CONNECT_CLI_VERSION}
gcloud docker -- push gcr.io/wizzie-registry/kafka-connect-cli:latest
