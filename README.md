# Beispiele zum Kurs: [IoT, Microservices, Machine Learning und DevOps – Moderne architektur-relevante Methoden und Technologien («MODTEC»)](https://www.digicomp.ch/trends/devops-trainings/iot-microservices-machine-learning-und-devops-moderne-architektur-relevante-methoden-und-technologien)

Für die Beispiele werden folgende Teile benötigt:
* [IoTKit V3](https://github.com/mc-b/iotkitv3)
* [lernkube Umgebung](https://github.com/mc-b/lernkube)

### Quick Start

Installiert [Git/Bash](https://git-scm.com/downloads), [Vagrant](https://www.vagrantup.com/) und [VirtualBox](https://www.virtualbox.org/).

Projekt [lernkube](https://github.com/mc-b/lernkube), auf der Git/Bash Kommandozeile (CLI), klonen, Konfigurationsdatei `DOK.yaml` kopieren und Installation starten. 

	git clone https://github.com/mc-b/lernkube
	cd lernkube
	cp templates/MODTEC.yaml config.yaml
	vagrant plugin install vagrant-disksize
	vagrant up

Öffnet die Interaktive Lernumgebung mittels [http://localhost:32188](http://localhost:32188), wechselt in das Verzeichnis `work` und wählt ein Notebook (ipynp Dateien) an.	

**Weitere Installationsmöglichkeiten und Details** zur Installation siehe Projekt [lernkube](https://github.com/mc-b/lernkube).

### Funktionsweise

* [IoTKit](https://github.com/mc-b/iotkitv3) --> MQTT-Protokoll --> [MQTT Broker](https://mosquitto.org/) --> [MQTT-Kafka-Bridge](https://github.com/jacklund/mqttKafkaBridge) 
--> [Pipe](https://github.com/mc-b/iot.kafka/blob/master/src/main/java/ch/mc_b/iot/kafka/Pipe.java) und [CSVConsumer](https://github.com/mc-b/iot.kafka/blob/master/src/main/java/ch/mc_b/iot/kafka/CSVConsumer.java) und [Alert](https://github.com/mc-b/iot.kafka/blob/master/src/main/java/ch/mc_b/iot/kafka/AlertConsumer.java) 

### Starten

	kubectl create -f duk/iot/mosquitto.yaml
	kubectl create -f duk/kafka
	kubectl create -f iot.kafka
	
In den Entsprechenden Logs der Container stehen die Meldungen drin, z.B.:

	logs iot-kafka-pipe