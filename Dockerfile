FROM openjdk:17-jdk-alpine3.13

RUN wget https://mirror.nodesdirect.com/apache/kafka/2.8.0/kafka_2.13-2.8.0.tgz && \
    tar zxf kafka_2.13-2.8.0.tgz -C /opt && rm -f kafka_2.13-2.8.0.tgz && \
    mv /opt/kafka* /opt/kafka && \
    sed -iserver.properties.back 's/num.partitions=1/num.partitions=100/g' /opt/kafka/config/kraft/server.properties

ENV PATH /sbin:/opt/kafka/bin/:$PATH

RUN apk --no-cache add bash
RUN kafka-storage.sh format -t $(kafka-storage.sh random-uuid) -c /opt/kafka/config/kraft/server.properties

COPY kafka_start.sh /opt/kafka/kafka_start.sh 

WORKDIR /opt/kafka

EXPOSE 9093 9092 2181

VOLUME ["/tmp/kafka-logs"]

CMD ["/opt/kafka/kafka_start.sh", "/opt/kafka/config/kraft/server.properties"]
