#!/bin/bash

# 指定保存镜像的目录
IMAGE_DIR="/vol1/1000/Images"

# 创建保存镜像的目录（如果不存在）
mkdir -p "$IMAGE_DIR"

# 获取所有镜像信息，包含仓库名和标签
IMAGE_INFO=$(docker images --format "{{.Repository}}:{{.Tag}} {{.ID}}")

# 遍历每个镜像信息
while read -r line; do
    # 提取仓库名和标签以及镜像 ID
    REPO_TAG=$(echo "$line" | awk '{print $1}')
    image_id=$(echo "$line" | awk '{print $2}')

    # 处理 <none>:<none> 情况
    if [ "$REPO_TAG" = "<none>:<none>" ]; then
        REPO_TAG="$image_id"
    fi

    # 将仓库名和标签中的 / 替换为 -
    SAFE_REPO_TAG="${REPO_TAG//\//-}"

    # 生成保存的文件名
    FILENAME="${SAFE_REPO_TAG// /_}.tar"

    # 保存镜像到指定目录
    docker save -o "$IMAGE_DIR/$FILENAME" "$REPO_TAG"
    echo "Saved image $REPO_TAG ($image_id) to $IMAGE_DIR/$FILENAME"
done <<< "$IMAGE_INFO"