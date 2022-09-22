#!/bin/bash

sudo apt-get update && sudo apt-get install iperf3 -y

echo "####################"

echo "Please enter the Server IP address:"

read ip

echo "####################"

echo "TCP testing with 1400 bytes for 10 seconds"

iperf3 -c $ip -t 10 --len 1400 -f M -i 1 -V
# -c: server we're connecting to, using the default port 5201
# -t: how many seconds we're running the test (transmitting data)
# --len: size of the packets. Using 1400 bytes as it's the WiFi TCP packet size limit
# -f: format to print bandwidth numbers (set to MB)
# -i: sets the interval time in seconds between periodic bandwidth, jitter, and loss reports
# -V: verbose mode