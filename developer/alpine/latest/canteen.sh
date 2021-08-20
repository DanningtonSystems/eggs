#!/usr/bin/env bash
if [ "$ProductMaster" = "true" ]; then
    echo "WARNING: Running in publisher mode, CTRL+C if you don't want to continue. Waiting for 5 seconds.."
    sleep 5
fi
docker build -t ghcr.io/danningtonsystems/developer:alpine-latest .
if [ "$ProductMaster" = "true" ]; then
    docker push ghcr.io/danningtonsystems/developer:alpine-latest
fi