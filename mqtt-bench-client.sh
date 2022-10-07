#!/bin/bash

sudo apt-get update -y && sudo apt update && sudo snap install go --classic #sudo apt-get install go -y

echo "####################"

echo "Downloading mqtt-benchmark"

go install github.com/krylovsk/mqtt-benchmark@main

cd && cd ~/go/bin/

echo "####################"

echo "Please enter the MQTT Broker IP address:"

read ip

echo "####################"

echo "QoS0 TEST: 10 clients sending 100 messages each"

./mqtt-benchmark --broker $ip:1883 --count 100 --clients 10 --qos 0 --message-interval 1 -quiet --format text >> "QoS0_10_Clients_$(date +%Y-%m-%d_%H:%M).log"

echo "QoS0 TEST: 100 clients sending 100 messages each"

./mqtt-benchmark --broker $ip:1883 --count 100 --clients 100 --qos 0 --message-interval 1 -quiet --format text >> "QoS0_100_Clients_$(date +%Y-%m-%d_%H:%M).log"

echo "####################"

echo "QoS1 TEST: 10 clients sending 100 messages each"

./mqtt-benchmark --broker $ip:1883 --count 100 --clients 10 --qos 1 --message-interval 1 -quiet --format text >> "QoS1_10_Clients_$(date +%Y-%m-%d_%H:%M).log"

echo "QoS1 TEST: 100 clients sending 100 messages each"

./mqtt-benchmark --broker $ip:1883 --count 100 --clients 100 --qos 1 --message-interval 1 -quiet --format text >> "QoS1_100_Clients_$(date +%Y-%m-%d_%H:%M).log"

echo "####################"

echo "QoS2 TEST: 10 clients sending 100 messages each"

./mqtt-benchmark --broker $ip:1883 --count 100 --clients 10 --qos 2 --message-interval 1 -quiet --format text >> "QoS2_10_Clients_$(date +%Y-%m-%d_%H:%M).log"

echo "QoS2 TEST: 100 clients sending 100 messages each"

./mqtt-benchmark --broker $ip:1883 --count 100 --clients 100 --qos 2 --message-interval 1 -quiet --format text >> "QoS2_100_Clients_$(date +%Y-%m-%d_%H:%M).log"