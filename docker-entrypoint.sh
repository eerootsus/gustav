#!/usr/bin/env sh

echo "Running gustav-server"
./gustav-server.sh &

echo "Running the initial dockerd-entrypoint"
./usr/local/bin/dockerd-entrypoint.sh
