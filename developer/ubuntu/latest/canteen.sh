#!/usr/bin/env bash
Publisher-Warning
docker build -t ghcr.io/danningtonsystems/developer:ubuntu-latest .
docker tag ghcr.io/danningtonsystems/developer:ubuntu-latest dannington/developer:ubuntu-latest
if [ "$ProductMaster" = "true" ]; then
    docker push ghcr.io/danningtonsystems/developer:ubuntu-latest
    docker push dannington/developer:ubuntu-latest
fi