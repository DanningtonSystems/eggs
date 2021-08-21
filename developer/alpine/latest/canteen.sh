#!/usr/bin/env bash
Publisher-Warning
docker build -t ghcr.io/danningtonsystems/developer:alpine-latest .
docker tag ghcr.io/danningtonsystems/developer:alpine-latest dannington/developer:alpine-latest
if [ "$ProductMaster" = "true" ]; then
    docker push ghcr.io/danningtonsystems/developer:alpine-latest
    docker push dannington/developer:alpine-latest
fi