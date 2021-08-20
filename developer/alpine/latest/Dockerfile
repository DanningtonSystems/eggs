# DanningtonSystems Dockerfile
# Description: Alpine Linux image designed for developer workloads, based on the latest Alpine docker image
# Licenced under GPLv3, see LICENSE.md in root of repository for details

FROM alpine:latest

LABEL author="Daniel Hyders"
LABEL maintainer="hello@bean.codes"

ENV STARSHIP_CONFIG=/starship.toml

RUN apk add --no-cache --update git ffmpeg curl wget gnupg ca-certificates bind-tools sqlite python3 tzdata xz libatomic bash zsh alpine-sdk sudo starship nano

COPY assets/start.sh /start.sh
COPY assets/profile /starship.sh
COPY assets/starship.toml /starship.toml

RUN ln -s /starship.sh /root/.zshrc; ln -s /starship.sh /root/.bashrc

CMD [ "/bin/bash", "/start.sh" ]