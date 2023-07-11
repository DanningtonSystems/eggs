#!/usr/bin/env bash
# array of versions to build
versions=(14 16 18)
Publisher-Warning

# loop through all the versions
for i in "${versions[@]}"; do
    cp -R ./entrypoint.sh ./$i
    docker build -t ghcr.io/danningtonsystems/node:$i ./$i
    if [ "$ProductMaster" = "true" ]; then
        # tag the image
        docker push ghcr.io/danningtonsystems/node:$i
    fi
    rm -rf ./$i/entrypoint.sh
done