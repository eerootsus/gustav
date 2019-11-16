#!/usr/bin/env sh

echo -e "\033[1mGUSTAV-SERVER\033[0m Waiting for Docker daemon to spin up..."
until docker ps 2>/dev/null
do
    sleep .1
done

echo -e "\033[1mGUSTAV-SERVER\033[0m  Docker daemon is up..."
docker version

echo -e "\033[1mGUSTAV-SERVER\033[0m Building Gustav server..."
docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t eerootsus/gustav-server:latest /gustav-server

echo -e "\033[1mGUSTAV-SERVER\033[0m Spawning Gustav server..."
docker run --name gustav-server -v /certs/client:/gustav-server/certs -d -p 3000:3000 eerootsus/gustav-server:latest

docker ps

docker logs -f gustav-server
