#!/usr/bin/env sh

echo "Waiting for Docker to spin up..."
until docker ps 2>/dev/null
do
    sleep 1
done

echo "Docker is up..."
docker version

echo "Spawning Gustav server..."
docker run --name gustav-manager -Pd node:12.13-alpine

docker ps
