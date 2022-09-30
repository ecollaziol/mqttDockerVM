#!/bin/bash

sudo yum update -y && sudo yum install go -y

echo "####################"

echo "Downloading mqtt-benchmark"

go install github.com/krylovsk/mqtt-benchmark@main

cd && cd go/bin/mqtt-benchmark

echo "####################"

echo "Please enter the MQTT Broker IP address:"

read ip

echo "####################"

echo "TCP testing for 15 seconds"

./mqtt-benchmark --broker $ip:1883 --count 2000 --clients 10 --qos 0 --message-interval 0 -quiet --format text