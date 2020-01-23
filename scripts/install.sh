#!/bin/bash
#
#	Installationsscript modtec

# IoT Umgebung 
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/iot/mosquitto.yaml
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/iot/nodered.yaml

# Messaging Umgebung (MQTT - Kafka Bridge neu mit Node-RED)
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/kafka/zookeeper.yaml
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/kafka/kafka.yaml
# kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/kafka/mqtt-kafka-bridge.yaml

# Kafka Streams 
kubectl apply -f https://raw.githubusercontent.com/mc-b/iot.kafka/master/iot-kafka-alert.yaml
kubectl apply -f https://raw.githubusercontent.com/mc-b/iot.kafka/master/iot-kafka-consumer.yaml
kubectl apply -f https://raw.githubusercontent.com/mc-b/iot.kafka/master/iot-kafka-pipe.yaml

# BPMN Umgebung und Upload BPMN Prozess
sudo docker pull camunda/camunda-bpm-platform
kubectl apply -f https://raw.githubusercontent.com/mc-b/misegr/master/bpmn/camunda.yaml

cd /vagrant
wget https://raw.githubusercontent.com/mc-b/misegr/master/bpmn/RechnungStep3.bpmn -O RechnungStep3.bpmn

sleep 30
for i in {1..150}; do # timeout for 5 minutes
   curl -k https://localhost:30443/engine-rest/deployment &> /dev/null
   if [ $? -eq 0 ]; then
      break
  fi
  sleep 2
done

curl -k -w "\n" \
-H "Accept: application/json" \
-F "deployment-name=rechnung" \
-F "enable-duplicate-filtering=true" \
-F "deploy-changed-only=true" \
-F "Rechnung.bpmn=@RechnungStep3.bpmn" \
https://localhost:30443/engine-rest/deployment/create