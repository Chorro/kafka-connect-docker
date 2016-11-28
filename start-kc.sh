#!/usr/bin/env bash

envsubst < ${KAFKA_HOME}/config/kc_worker_env.properties > ${KAFKA_HOME}/config/kc_worker.properties

${KAFKA_HOME}/bin/connect-distributed.sh ${KAFKA_HOME}/config/kc_worker.properties
