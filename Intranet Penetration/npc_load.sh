#!/bin/bash

# 提示用户输入密钥和路径
read -p "请输入密钥: " user_key
read -p "请输入路径（例如 /new_path）: " user_path

# 下载 npc_compose.yml 文件
wget https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Intranet%20Penetration/npc_compose.yml

# 检查下载是否成功
if [ $? -ne 0 ]; then
    echo "下载 npc_compose.yml 文件失败，脚本终止。"
    exit 1
fi

# 替换 npc_compose.yml 文件中的密钥和路径
sed -i "s/自行填写密钥/$user_key/" npc_compose.yml
sed -i "s#/vol1/1000/#$user_path/#" npc_compose.yml

# 检查替换是否成功（这里简单假设文件存在就认为替换可能成功）
if [ ! -f "npc_compose.yml" ]; then
    echo "替换操作出现问题，未找到 npc_compose.yml 文件，脚本终止。"
    exit 1
fi

# 使用 docker compose 启动服务
docker compose -f npc_compose.yml up -d

# 检查服务启动是否成功
if [ $? -eq 0 ]; then
    echo "NPC 服务已成功启动。"
else
    echo "启动 NPC 服务失败，请检查配置和 Docker 环境。"
fi
