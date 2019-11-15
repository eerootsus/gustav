#!/usr/bin/env sh
docker stop gustav || true && \
docker rm gustav || true && \
docker run --privileged --name gustav -d \
    --network-alias gustav \
    eerootsus/gustav:latest && \
docker logs -f gustav
