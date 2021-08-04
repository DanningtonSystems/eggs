#!/usr/bin/env bash
cp ./entrypoint.sh ./14
cp ./entrypoint.sh ./16
docker build -t ghcr.io/danningtonsystems/node:16 ./16/
docker build -t ghcr.io/danningtonsystems/node:14 ./14/
docker push ghcr.io/danningtonsystems/node:16
docker push ghcr.io/danningtonsystems/node:14
rm -rf ./14/entrypoint.sh
rm -rf ./16/entrypoint.sh