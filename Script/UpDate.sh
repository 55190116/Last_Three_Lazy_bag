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
if [ -n "$all_containers" ]; then
    # 处理要跳过的容器
    for container in $skip_containers; do
        skip_id=$(docker ps -aqf "name=$container")
        if [ -n "$skip_id" ]; then
            all_containers=$(echo "$all_containers" | grep -v "$skip_id")
        fi
    done

    if [ -n "$all_containers" ]; then
        # 停止容器
        for container_id in $all_containers; do
            container_name=$(docker inspect --format='{{.Name}}' "$container_id" | sed 's/^\///')
            if docker stop "$container_id" > /dev/null 2>&1; then
                echo "容器 $container_name ($container_id) 已停止。"
            else
                error_info=$(docker stop "$container_id" 2>&1)
                echo "停止容器 $container_name ($container_id) 失败: $error_info"
            fi
        done

        # 删除容器
        for container_id in $all_containers; do
            container_name=$(docker inspect --format='{{.Name}}' "$container_id" | sed 's/^\///')
            if docker rm "$container_id" > /dev/null 2>&1; then
                echo "容器 $container_name ($container_id) 已删除。"
            else
                error_info=$(docker rm "$container_id" 2>&1)
                echo "删除容器 $container_name ($container_id) 失败: $error_info"
            fi
        done
    else
        echo "所有容器都被跳过，无需对容器进行操作。"
    fi
else
    echo "当前没有正在运行或已停止的 Docker 容器，无需对容器进行操作。"
fi

# 查找 Compose 文件夹
echo "正在查找 Compose 文件夹..."
compose_folders=$(sudo find / -type d -name "Compose")

if [ -z "$compose_folders" ]; then
    echo "未找到 Compose 文件夹。"
else
    echo "找到以下 Compose 文件夹："
    echo "$compose_folders"

    # 查找并删除 docker-compose-1.yml 到 docker-compose-10.yml 文件
    for folder in $compose_folders; do
        for i in {1..10}; do
            file="$folder/docker-compose-$i.yml"
            if [ -f "$file" ]; then
                if rm "$file"; then
                    echo "已删除文件: $file"
                else
                    echo "删除文件 $file 失败。"
                fi
            fi
        done
    done
fi

# 让用户选择系统
echo "请选择系统："
echo "1. 飞牛系统"
echo "2. 群晖系统"
echo "3. 绿联（旧系统）"
echo "4. 绿联（新系统）"
echo "5. 极空间（暂不支持）"
while true; do
    read -p "请输入对应的数字 (1-5): " system_choice
    case "$system_choice" in
        1)
            system="fnOS"
            break
            ;;
        2)
            system="Synology"
            break
            ;;
        3)
            system="Ugreen"
            break
            ;;
        4)
            system="UgreenNew"
            break
            ;;
        5)
            echo "极空间系统暂不支持，无法拉取文件。"
            exit 1
            ;;
        *)
            echo "无效输入，请输入 1 到 5 之间的数字。"
            ;;
    esac
done

# 拉取文件
if [ -n "$compose_folders" ]; then
    for folder in $compose_folders; do
        for i in {1..10}; do
            url="https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/$system/docker-compose-$i.yml"
            file="$folder/docker-compose-$i.yml"
            if wget -q -O "$file" "$url"; then
                echo "成功拉取文件 $file"
            else
                echo "拉取文件 $file 失败，URL: $url"
            fi
        done
    done
else
    echo "由于未找到 Compose 文件夹，无法拉取文件。"
fi
