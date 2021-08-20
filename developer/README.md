# Developer OCI images

OCI/Docker images specifically for developers to test, debug, and play with different distributions under OCI-compliant systems. ZSH is the default shell in all containers, however Bash is also installed. Both shells are pre-configured with Starship, a terminal prompt formatter, along with a custom Starship configuration.

## How to run these images

To run DanningtonSystems developer images and attach directly to the startup shell:
`docker run -it --rm ghcr.io/danningtonsystems/developer:[folder name of tag that you want to use]`

For example, if you wanted to use `alpine-latest`:
`docker run -it --rm ghcr.io/danningtonsystems/developer:alpine-latest`