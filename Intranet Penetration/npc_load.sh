#!/bin/bash

# 定义要拉取的 docker-compose.yml 文件的 URL
url="https://example.com/docker-compose.yml"  # 请替换为实际的文件 URL

# 使用 wget 拉取 docker-compose.yml 文件
echo "正在从 $url 拉取 docker-compose.yml 文件..."
wget -q $url
if [ $? -ne 0 ]; then
    echo "拉取 docker-compose.yml 文件失败，请检查 URL 或网络连接。"
    exit 1
fi

# 提示用户输入密钥
read -p "请输入密钥: " vkey

# 提示用户输入宿主机挂载路径
read -p "请输入宿主机挂载路径（用于替换 /vol1/1000/）: " host_path

# 检查 docker-compose.yml 文件是否存在
if [ ! -f "docker-compose.yml" ]; then
    echo "docker-compose.yml 文件不存在，请检查拉取操作是否成功。"
    exit 1
fi

# 替换 docker-compose.yml 文件中的密钥
sed -i "s/自行填写密钥/$vkey/g" docker-compose.yml

# 替换 docker-compose.yml 文件中的挂载路径
sed -i "s|/vol1/1000/|$host_path/|g" docker-compose.yml

# 运行 Docker Compose 文件
docker-compose up -d

# 检查 Docker Compose 命令是否成功执行
if [ $? -eq 0 ]; then
    echo "服务已成功启动。"
else
    echo "启动服务时出现错误，请检查相关配置。"
fi