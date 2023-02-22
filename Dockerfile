# Container image that runs your code
FROM alpine:3.14

RUN apk update && \
    apk add --no-cache git openssh-client less && \
    apk add --no-cache --virtual .build-deps \
        ca-certificates \
        curl \
        tar

RUN apt-get update && \
    apt-get install -y curl git && \
    apk add github-cli

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]