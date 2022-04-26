# Beispiele zum Kurs: [IoT, Microservices, Machine Learning und DevOps – Moderne architektur-relevante Methoden und Technologien («MODTEC»)](https://www.digicomp.ch/trends/devops-trainings/iot-microservices-machine-learning-und-devops-moderne-architektur-relevante-methoden-und-technologien)

Für die Beispiele werden folgende Teile benötigt:
* [IoTKit V3](https://github.com/mc-b/iotkitv3)
* [lernkube Umgebung](https://github.com/mc-b/lernkube)

### Quick Start

Installiert [Git/Bash](https://git-scm.com/downloads), [Multipass](https://multipass.run/) und [Terraform](https://www.terraform.io/).

Projekt [modtec](https://github.com/mc-b/modtec), auf der Git/Bash Kommandozeile (CLI), klonen und Installation starten. 

    git clone https://github.com/mc-b/modtec
    cd modtec
    terraform init
    terraform apply

Öffnet die Interaktive Lernumgebung mittels [http://modtec-30-default.mshome.net:32188](http://modtec-30-default.mshome.net:32188), wechselt in das Verzeichnis `work` und wählt ein Notebook (ipynp Dateien) an.	

Wird die Umgebung nicht mehr gebraucht kann sie wie folgt gelöscht werden:

    terraform destroy

### Funktionsweise

![](https://raw.githubusercontent.com/iotkitv3/intro/main/images/edge-ml.png)

- - - 

* [IoTKit](https://github.com/mc-b/iotkitv3) --> MQTT-Protokoll --> [MQTT Broker](https://mosquitto.org/) --> [MQTT-Kafka-Bridge](https://github.com/jacklund/mqttKafkaBridge) 
--> [Pipe](https://github.com/mc-b/iot.kafka/blob/master/src/main/java/ch/mc_b/iot/kafka/Pipe.java) und [CSVConsumer](https://github.com/mc-b/iot.kafka/blob/master/src/main/java/ch/mc_b/iot/kafka/CSVConsumer.java) und [Alert](https://github.com/mc-b/iot.kafka/blob/master/src/main/java/ch/mc_b/iot/kafka/AlertConsumer.java) 

Die erzeugten Meldungen können im [Kubernetes Dashboard](https://modtec-30-default.mshome.net:8443) angeschaut werden.

Dazu ist `Pods`, dann einen der obigen Services `iot-kafka-*` anzuwählen und dann `Logs`.