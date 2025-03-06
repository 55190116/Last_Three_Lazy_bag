#!/bin/bash

# 仓库所有者
owner="ATaKi-Myt"
# 仓库名称
repo="Last_Three_Lazy_bag"
# 文件夹路径
path="Plugins"

# 获取文件列表信息
response=$(wget -qO- "https://api.github.com/repos/$owner/$repo/contents/$path")

# 从响应中提取文件名和下载链接
file_info=$(echo "$response" | grep -Eo '"name":"[^"]+","download_url":"[^"]+"')
while read -r line; do
    # 提取文件名
    file_name=$(echo "$line" | grep -Eo '"name":"[^"]+"' | cut -d'"' -f4)
    # 提取下载链接
    download_url=$(echo "$line" | grep -Eo '"download_url":"[^"]+"' | cut -d'"' -f4)
    # 下载文件
    wget -O "$file_name" "$download_url"
    echo "Downloaded $file_name"
done <<< "$file_info"
