#!/bin/bash


sudo apt-get update -y && sudo apt-get install iperf3 -y

echo "####################"

echo "Starting server and listening on default port 5201"

iperf3 -s -V > "SERVER_$(date +%Y-%m-%d_%H:%M).log"
# -s: server mode
# -V: verbose mode