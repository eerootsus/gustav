#!/usr/bin/env sh

echo -e "\033[1mGUSTAV-SERVER\033[0m Waiting for Docker daemon to spin up..."
until docker ps 2>/dev/null
do
    sleep 1
done

echo -e "\033[1mGUSTAV-SERVER\033[0m  Docker daemon is up..."
docker version

echo -e "\033[1mGUSTAV-SERVER\033[0m Spawning Gustav server..."
docker run --name gustav-manager -Pd node:12.13-alpine

docker ps
