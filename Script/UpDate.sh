#!/bin/bash

# 询问用户是否运行脚本
while true; do
    read -p "是否要运行此脚本，停止并删除所有 Docker 容器？(y/n): " confirm
    case "$confirm" in
        [Yy])
            break
            ;;
        [Nn])
            echo "操作已取消。"
            exit 0
            ;;
        *)
            echo "无效输入，请输入 'y' 或 'n'。"
            ;;
    esac
done

# 询问用户要跳过的容器名字
read -p "请输入要跳过操作的容器名字（多个名字用空格分隔，若没有则直接回车）: " skip_containers

# 获取所有容器 ID
all_containers=$(docker ps -aq)
if [ -z "$all_containers" ]; then
    echo "当前没有正在运行或已停止的 Docker 容器，无需操作。"
    exit 0
fi

# 处理要跳过的容器
for container in $skip_containers; do
    skip_id=$(docker ps -aqf "name=$container")
    if [ -n "$skip_id" ]; then
        all_containers=$(echo "$all_containers" | grep -v "$skip_id")
        if [ -z "$all_containers" ]; then
            echo "所有容器都被跳过，无需操作。"
            exit 0
        fi
    fi
done

# 停止容器
for container_id in $all_containers; do
    if docker stop "$container_id" > /dev/null 2>&1; then
        echo "容器 $container_id 已停止。"
    else
        echo "停止容器 $container_id 失败。"
    fi
done

# 删除容器
for container_id in $all_containers; do
    if docker rm "$container_id" > /dev/null 2>&1; then
        echo "容器 $container_id 已删除。"
    else
        echo "删除容器 $container_id 失败。"
    fi
done