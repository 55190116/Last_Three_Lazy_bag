#!/bin/bash

# 设置DOCKER_CONFIG环境变量，如果未设置则使用默认值$HOME/.docker
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

# 创建目录，如果目录已存在则不会报错
if ! mkdir -p "$DOCKER_CONFIG/cli-plugins"; then
    echo "Failed to create directory $DOCKER_CONFIG/cli-plugins. Please check your permissions."
    exit 1
fi

# 下载docker-compose二进制文件到指定目录
if ! curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o "$DOCKER_CONFIG/cli-plugins/docker-compose"; then
    echo "Failed to download docker-compose. Please check your network connection."
    exit 1
fi

# 为下载的docker-compose文件添加可执行权限
if ! chmod +x "$DOCKER_CONFIG/cli-plugins/docker-compose"; then
    echo "Failed to set executable permission for docker-compose. Please check your permissions."
    exit 1
fi

# 检查docker compose的版本
docker compose version
