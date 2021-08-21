# DanningtonSystems Dockerfile
# Description: Alpine Linux image designed for developer workloads, based on the latest Alpine docker image
# Licenced under GPLv3, see LICENSE.md in root of repository for details

FROM ubuntu:latest

LABEL author="Daniel Hyders"
LABEL maintainer="hello@bean.codes"

ENV STARSHIP_CONFIG=/starship.toml
ENV TZ=UTC

RUN DEBIAN_FRONTEND="noninteractive" apt update
RUN DEBIAN_FRONTEND="noninteractive" apt install -y git ffmpeg curl wget gnupg ca-certificates dnsutils tzdata sqlite python3 tar libatomic-ops-dev bash zsh build-essential sudo nano neofetch
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
RUN echo "root:container" | chpasswd
RUN echo "container" | chsh -s /bin/zsh

COPY assets/start.sh /start.sh
COPY assets/profile /starship.sh
COPY assets/starship.toml /starship.toml

RUN cat /starship.sh >> /root/.zshrc
RUN cat /starship.sh >> /root/.bashrc

CMD [ "/bin/bash", "/start.sh" ]