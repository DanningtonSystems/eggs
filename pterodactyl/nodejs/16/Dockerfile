# DanningtonSystems Dockerfile
# Description: Node.js (Alpine), 16.x
# Requires v1.4.x of Pterodactyl and Wings in order to run
# Licenced under GPLv3, see LICENSE.md in root of repository for details

FROM node:16-alpine

LABEL author="Daniel Hyders"
LABEL maintainer="hello@bean.codes"

RUN apk add --no-cache --update git ffmpeg curl wget gnupg ca-certificates bind-tools sqlite python3 tzdata xz libatomic bash rsync openssh make

RUN apk add --no-cache --update yarn

RUN adduser --disabled-password --home /home/container container

RUN git config --global pull.rebase false

RUN ln -s /usr/bin/python3 /usr/bin/python

USER container

ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
