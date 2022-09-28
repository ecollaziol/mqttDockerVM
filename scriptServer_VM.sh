#!/bin/bash


sudo yum update -y && sudo yum install iperf3 -y

echo "####################"

echo "Starting server and listening on default port 5201"

iperf3 -s -V >> "SERVER_$(date +%Y-%m-%d_%H:%M).log"
# -s: server mode
# -V: verbose mode