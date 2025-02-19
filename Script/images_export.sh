#!/bin/bash

# 检查是否提供了镜像名称和标签
if [ $# -ne 1 ]; then
    echo "用法: $0 <镜像名称:标签>"
    exit 1
fi

# 获取输入的镜像名称和标签
IMAGE_NAME=$1

# 提取镜像名称（去除标签部分）用于生成文件名
BASE_IMAGE_NAME=$(echo $IMAGE_NAME | cut -d ':' -f 1 | tr '/' '_')
TAG=$(echo $IMAGE_NAME | cut -d ':' -f 2)
if [ -z "$TAG" ]; then
    TAG="latest"
fi

# 生成导出的 .tar 文件的名称
TAR_FILE="${BASE_IMAGE_NAME}_${TAG}.tar"

# 拉取 Docker 镜像
echo "正在拉取 Docker 镜像: $IMAGE_NAME ..."
docker pull $IMAGE_NAME

# 检查拉取是否成功
if [ $? -ne 0 ]; then
    echo "镜像拉取失败，请检查镜像名称和网络连接。"
    exit 1
fi

# 导出镜像为 .tar 文件
echo "正在导出镜像为 .tar 文件: $TAR_FILE ..."
docker save -o $TAR_FILE $IMAGE_NAME

# 检查导出是否成功
if [ $? -eq 0 ]; then
    echo "镜像导出成功，文件路径: $TAR_FILE"
else
    echo "镜像导出失败，请检查权限和磁盘空间。"
fi