# Use the following command to start an eclipse-mosquitto container

docker run -it --rm -p 1883:1883 eclipse-mosquitto:1.6.9 mosquitto

docker run -it --rm -d -p 1883:1883 eclipse-mosquitto:1.6.9 mosquitto


# Version 1.6.9 is used due to issues with the most recent versions


sudo apt-get update -y && sudo apt-get install mosquitto=1.6.9-1 -y

sudo systemctl start mosquitto

sudo systemctl stop mosquitto