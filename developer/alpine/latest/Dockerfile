# DanningtonSystems Dockerfile
# Description: Alpine Linux image designed for developer workloads, based on the latest Alpine docker image
# Licenced under GPLv3, see LICENSE.md in root of repository for details

FROM alpine:latest

LABEL author="Daniel Hyders"
LABEL maintainer="hello@bean.codes"

ENV STARSHIP_CONFIG=/starship.toml

RUN apk add --no-cache --update git ffmpeg curl wget gnupg ca-certificates bind-tools sqlite python3 tzdata xz libatomic bash zsh alpine-sdk sudo starship nano neofetch util-linux shadow openssh rsync
RUN echo "root:container" | chpasswd
RUN echo "container" | chsh -s /bin/zsh

COPY assets/start.sh /start.sh
COPY assets/profile /starship.sh
COPY assets/starship.toml /starship.toml

RUN cat /starship.sh >> /root/.zshrc
RUN cat /starship.sh >> /root/.bashrc

CMD [ "/bin/bash", "/start.sh" ]