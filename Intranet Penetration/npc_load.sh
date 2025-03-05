#!/bin/bash

# 下载 npc_compose.yml 文件
echo "开始下载 npc_compose.yml 文件..."
wget https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/main/Intranet%20Penetration/npc_compose.yml

# 检查下载是否成功
if [ $? -ne 0 ]; then
    echo "下载 npc_compose.yml 文件失败，脚本终止。"
    exit 1
fi

# 提示用户输入密钥和路径
read -p "请输入密钥: " user_key
read -p "请输入路径（例如 /new_path）: " user_path

# 保存替换前的文件内容
old_content=$(cat npc_compose.yml)

# 替换 npc_compose.yml 文件中的密钥和路径
echo "开始替换文件中的密钥和路径..."
sed -i "s/自行填写密钥/$user_key/" npc_compose.yml
sed -i "s#/vol1/1000/#$user_path/#" npc_compose.yml

# 保存替换后的文件内容
new_content=$(cat npc_compose.yml)

# 检查替换是否成功
if [ "$old_content" = "$new_content" ]; then
    echo "替换操作未生效，请检查替换内容和文件格式，脚本终止。"
    exit 1
fi

# 使用 docker compose 启动服务
echo "开始使用 Docker Compose 启动服务..."
if command -v docker compose &> /dev/null; then
    docker compose -f npc_compose.yml --quiet-pull --remove-orphans up -d
elif command -v docker-compose &> /dev/null; then
    docker-compose -f npc_compose.yml --quiet-pull --remove-orphans up -d
else
    echo "未找到 Docker Compose 命令，请安装 Docker Compose。"
    exit 1
fi

# 检查服务启动是否成功
if [ $? -eq 0 ]; then
    echo "NPC 服务已成功启动。"
else
    echo "启动 NPC 服务失败，请检查配置和 Docker 环境。"
fi
