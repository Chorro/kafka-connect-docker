FROM wurstmeister/kafka

MAINTAINER jjchorro@wizzie.io

RUN apk add gettext

ENV WORKER_REST_PORT=8083 WORKER_GROUP_ID="group-id"

EXPOSE ${WORKER_REST_PORT}

ADD kafka-connect-jdbc-3.1.1.jar $KAFKA_HOME/libs

ADD kc_worker_env.properties $KAFKA_HOME/config
ADD start-kc.sh /usr/bin/start-kc.sh

RUN chmod a+x /usr/bin/start-kc.sh

CMD start-kc.sh