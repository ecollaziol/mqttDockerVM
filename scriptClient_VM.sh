#!/bin/bash

sudo apt-get update -y && sudo apt-get install iperf3 -y

echo "####################"

echo "Please enter the Server IP address:"

read ip

echo "####################"

echo "TCP testing for 15 seconds"

iperf3 -c $ip -t 15 -f M -i 1 -V > "TCP_$(date +%Y-%m-%d_%H:%M).log"
# -c: server we're connecting to, using the default port 5201
# -t: how many seconds we're running the test (transmitting data)
# -f: format to print bandwidth numbers (set to MB)
# -i: sets the interval time in seconds between periodic bandwidth, jitter, and loss reports
# -V: verbose mode

echo "UDP testing for 15 seconds with 1400 bytes"

iperf3 -c $ip -t 15 --udp --len 1400 -f M -i 1 -V > "UDP_$(date +%Y-%m-%d_%H:%M).log" 
# -c: server we're connecting to, using the default port 5201
# -t: how many seconds we're running the test (transmitting data)
# --udp: use UDP rather than TCP
# --len: size of the packets. Using 1400 bytes as it's the WiFi UDP packet size limit
# -f: format to print bandwidth numbers (set to MB)
# -i: sets the interval time in seconds between periodic bandwidth, jitter, and loss reports
# -V: verbose mode