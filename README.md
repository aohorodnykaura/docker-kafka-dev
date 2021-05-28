# docker-kafka-dev

```
kafka:
  image: aohorodnykpango/kafka-dev:latest
  hostname: kafka
  container_name: kafka
  environment:
    KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://localhost:9092
  ports:
    - "127.0.0.1:9092:9092"
```
