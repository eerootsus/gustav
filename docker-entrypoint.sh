#!/usr/bin/env sh

echo -e "\033[1mGUSTAV\033[0m Running gustav-server startup script..."
./gustav-server.sh &

echo -e "\033[1mGUSTAV\033[0m Running the initial dockerd-entrypoint..."
./usr/local/bin/dockerd-entrypoint.sh
