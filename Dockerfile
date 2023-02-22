# Container image that runs your code
FROM alpine:3.14

RUN apk update && \
    apk add --no-cache git openssh-client less && \
    apk add --no-cache --virtual .build-deps \
        ca-certificates \
        curl \
        tar

RUN curl -L -o /tmp/gh.tar.gz https://github.com/cli/cli/releases/latest/download/gh_$(curl -s https://api.github.com/repos/cli/cli/releases/latest | grep 'tag_name' | cut -d'"' -f4)_linux_amd64.tar.gz && \
    tar xzf /tmp/gh.tar.gz -C /tmp/ && \
    mv /tmp/gh_* /usr/local/bin/gh && \
    rm -rf /tmp/gh*

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]