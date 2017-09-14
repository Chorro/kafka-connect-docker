#!/bin/bash

#### INIT ####
rm -f -r kafka-connect/libs/
mkdir kafka-connect/libs
source ./VERSIONS

#### MQTT Instalation ####
rm -f -r kafka-connect-mqtt
git clone https://github.com/wizzie-io/kafka-connect-mqtt.git
(cd kafka-connect-mqtt; ./gradlew clean jar copyRuntimeLibs)
cp kafka-connect-mqtt/build/libs/kafka-connect-mqtt-*.jar ./kafka-connect/libs/
cp kafka-connect-mqtt/build/output/lib/org.eclipse.paho.client.mqttv3-*.jar ./kafka-connect/libs/
rm -f -r kafka-connect-mqtt

#### Syslog Instalation ####
rm -f -r kafka-connect-syslog
git clone https://github.com/jcustenborder/kafka-connect-syslog.git
(cd kafka-connect-syslog; git checkout 0.2.15; mvn clean package; tar -xvf target/kafka-connect-syslog-0.2-SNAPSHOT.tar.gz)
cp -r kafka-connect-syslog/usr/share/java/kafka-connect-syslog/ ./kafka-connect/libs/
rm -f -r kafka-connect-syslog

#### Docker Build ####

(cd ./kafka-connect; docker build -t wizzie-kc:${KAFKA_CONNECT_VERSION} .; rm -f -r libs/)

(cd kafka-connect-cli; wget https://github.com/datamountaineer/kafka-connect-tools/releases/download/v${KAFKA_CONNECT_CLI_VERSION}/kafka-connect-cli-${KAFKA_CONNECT_CLI_VERSION}-all.jar; docker build -t kafka-connect-cli:${KAFKA_CONNECT_CLI_VERSION} .; rm -f kafka-connect-cli-${KAFKA_CONNECT_CLI_VERSION}-all.jar)
