#!/bin/bash
read -p "请输入密钥: " user_key \
read -p "请输入路径（例如 /new_path）: " user_path \
wget https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Intranet%20Penetration/npc_compose.yml \
sed -i "s/自行填写密钥/$user_key/" npc_compose.yml \
sed -i "s#/vol1/1000/#$user_path/#" npc_compose.yml \
docker compose -f npc_compose.yml up -d \
