#!/bin/bash

# 提示用户输入密钥和路径
read -p "请输入密钥: " user_key
read -p "请输入路径（例如 /new_path）: " user_path

# 使用 wget 拉取文件
wget https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Intranet%20Penetration/npc_compose.yml

# 替换密钥和路径
sed -i "s/自行填写密钥/$user_key/" npc_compose.yml
sed -i "s#/vol1/1000/#$user_path/#" npc_compose.yml

# 执行 compose 文件（假设已经安装了 docker-compose）
docker-compose -f npc_compose.yml up -d
