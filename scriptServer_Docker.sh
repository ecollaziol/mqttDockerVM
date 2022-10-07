#!/bin/bash

echo "####################"

echo "Starting server inside Docker container and listening on default port 5201"

docker run  -it --rm --name=iperf3-server -p 5201:5201 -p 5201:5201/udp networkstatic/iperf3 -s -V >> "DOCKER_SERVER_$(date +%Y-%m-%d_%H:%M).log"
# -it: allocate a tty with STDIN for the container process
# --rm: removes the container once exited
# --name: name of the container
# -p 5201:5201 -p 5201:5201/udp – exposes port 5201 on both TCP and UDP modes. Without this, the UDP test fails.
# -s: server mode
# -V: verbose mode