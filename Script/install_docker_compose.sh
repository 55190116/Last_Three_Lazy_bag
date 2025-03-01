#!/bin/bash

# 设置 DOCKER_CONFIG 环境变量
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

# 创建 cli-plugins 目录
mkdir -p "$DOCKER_CONFIG/cli-plugins"

# 检查目录创建是否成功
if [ $? -ne 0 ]; then
    echo "创建 $DOCKER_CONFIG/cli-plugins 目录失败，脚本终止。"
    exit 1
fi

# 下载 docker-compose 二进制文件
echo "开始下载 docker-compose 二进制文件..."
curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o "$DOCKER_CONFIG/cli-plugins/docker-compose"

# 检查下载是否成功
if [ $? -ne 0 ]; then
    echo "下载 docker-compose 二进制文件失败，脚本终止。"
    exit 1
fi

# 赋予 docker-compose 可执行权限
chmod +x "$DOCKER_CONFIG/cli-plugins/docker-compose"

# 检查权限设置是否成功
if [ $? -ne 0 ]; then
    echo "赋予 $DOCKER_CONFIG/cli-plugins/docker-compose 可执行权限失败，脚本终止。"
    exit 1
fi

# 检查 docker compose 版本
echo "检查 docker compose 版本..."
docker compose version

# 检查版本检查命令是否成功执行
if [ $? -ne 0 ]; then
    echo "检查 docker compose 版本失败，可能安装未成功。"
    exit 1
else
    echo "docker compose 安装成功。"
fi
