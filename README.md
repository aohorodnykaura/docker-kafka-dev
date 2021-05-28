# docker-kafka-dev

```
version: "3.8"
services:
  kafka:
    image: aohorodnykpango/kafka-dev:2.8.0
    hostname: kafka
    container_name: kafka
    ports:
      - "127.0.0.1:9092:9092"
```
