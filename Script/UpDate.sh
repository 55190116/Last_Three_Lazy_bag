#!/bin/bash

# 询问用户是否要运行脚本
read -p "你是否要停止并删除所有容器（排除指定容器）？(y/n): " answer
if [ "$answer" != "y" ]; then
    echo "脚本已取消。"
    exit 0
fi

# 询问用户要排除的容器名称
read -p "请输入要排除的容器名称，多个名称用空格分隔（若没有请直接按回车键）: " exclude_containers

# 获取所有容器的 ID
all_containers=$(docker ps -aq)

# 循环停止并删除容器，排除指定的容器
for container in $all_containers; do
    container_name=$(docker inspect --format='{{.Name}}' $container | sed 's/^\///')
    should_exclude=false
    for exclude in $exclude_containers; do
        if [ "$container_name" = "$exclude" ]; then
            should_exclude=true
            break
        fi
    done
    if [ "$should_exclude" = false ]; then
        echo "正在停止容器: $container_name"
        docker stop $container > /dev/null 2>&1
        echo "正在删除容器: $container_name"
        docker rm $container > /dev/null 2>&1
    fi
done

echo "更新完成。"
