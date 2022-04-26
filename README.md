# Beispiele zum Kurs: [IoT, Microservices, Machine Learning und DevOps – Moderne architektur-relevante Methoden und Technologien («MODTEC»)](https://www.digicomp.ch/trends/devops-trainings/iot-microservices-machine-learning-und-devops-moderne-architektur-relevante-methoden-und-technologien)

Für die Beispiele werden folgende Teile benötigt:
* [IoTKit V3](https://github.com/mc-b/iotkitv3)
* [lernkube Umgebung](https://github.com/mc-b/lernkube)

### Quick Start

Installiert [Multipass](https://multipass.run/).

**Linux & Mac**

    curl -sfL https://raw.githubusercontent.com/mc-b/modtec/master/cloud-init.yaml | multipass launch --name modtec-30-default -c2 -m8GB -d32GB --cloud-init -

**Windows PowerShell**    

    $wr = Invoke-WebRequest 'https://raw.githubusercontent.com/mc-b/modtec/master/cloud-init.yaml'
    $wr.content | multipass launch --name modtec-30-default -c2 -m8GB -d32GB --cloud-init -

Öffnet die Interaktive Lernumgebung mittels [http://modtec-30-default.mshome.net:32188](http://modtec-30-default.mshome.net:32188), wechselt in das Verzeichnis `work` und wählt ein Notebook (ipynp Dateien) an.	

### Funktionsweise

![](https://raw.githubusercontent.com/iotkitv3/intro/main/images/edge-ml.png)

- - - 

* [IoTKit](https://github.com/mc-b/iotkitv3) --> MQTT-Protokoll --> [MQTT Broker](https://mosquitto.org/) --> [MQTT-Kafka-Bridge](https://github.com/jacklund/mqttKafkaBridge) 
--> [Pipe](https://github.com/mc-b/iot.kafka/blob/master/src/main/java/ch/mc_b/iot/kafka/Pipe.java) und [CSVConsumer](https://github.com/mc-b/iot.kafka/blob/master/src/main/java/ch/mc_b/iot/kafka/CSVConsumer.java) und [Alert](https://github.com/mc-b/iot.kafka/blob/master/src/main/java/ch/mc_b/iot/kafka/AlertConsumer.java) 

Die erzeugten Meldungen können im [Kubernetes Dashboard](https://modtec-30-default.mshome.net:8443) angeschaut werden.

Dazu ist `Pods`, dann einen der obigen Services `iot-kafka-*` anzuwählen und dann `Logs`.