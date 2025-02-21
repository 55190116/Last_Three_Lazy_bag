#!/bin/bash

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

if ! mkdir -p "$DOCKER_CONFIG/cli-plugins"; then
    echo "Failed to create directory $DOCKER_CONFIG/cli-plugins"
    exit 1
fi

if ! curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o "$DOCKER_CONFIG/cli-plugins/docker-compose"; then
    echo "Failed to download docker-compose"
    exit 1
fi

if ! chmod +x "$DOCKER_CONFIG/cli-plugins/docker-compose"; then
    echo "Failed to set executable permission for docker-compose"
    exit 1
fi

docker compose version
