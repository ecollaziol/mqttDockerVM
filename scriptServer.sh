#!/bin/bash


sudo yum update -y && sudo yum install iperf3 -y

echo "####################"

echo "Starting server and listening on default port 5201"

iperf3 -s -V
# -s: server mode
# -V: verbose mode