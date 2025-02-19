#!/bin/bash

# 遍历当前目录下所有 .tar 文件
for file in *.tar; do
    if [ -f "$file" ]; then
        docker load -i "$file"
        echo "Loaded image from $file"
    fi
done