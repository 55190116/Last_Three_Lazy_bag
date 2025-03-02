#!/bin/bash

echo -e "\n即将删除所有服务及指定文件夹"
read -p "确认操作？(y/n) " confirm

if [[ $confirm != [yY] ]]; then
  echo "操作已取消"
  exit 1
fi

# 停止所有正在运行的 Docker 容器
docker stop $(docker ps -aq)

# 删除所有 Docker 容器
docker rm $(docker ps -aq)

# 删除所有 Docker 镜像
docker rmi $(docker images -aq)

# 定义要删除的文件夹列表
folders_to_delete=(
    "Compose"
    "Downloads"
    "Music"
    "Docker"
    "Synchronous"
    "Video"
    "媒体元"
)

# 遍历文件夹列表并删除
for folder in "${folders_to_delete[@]}"; do
    folder_path="/vol1/1000/${folder}"
    if [ -d "$folder_path" ]; then
        rm -rf "$folder_path"
        echo "已删除文件夹: $folder_path"
    else
        echo "警告: 文件夹 $folder_path 不存在，跳过"
    fi
done
