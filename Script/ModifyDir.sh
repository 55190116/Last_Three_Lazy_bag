#!/bin/bash

echo "飞牛路径示例：/vol1/1000/"
echo "群晖路径示例：/volume1/My/ My：根路径名称"
echo "绿联旧系统路径示例：/mnt/dm-1/.ugreen_nas/509155/ 509155：用户文件名"
read -p "请输入替换后的新路径: " new_path

echo -e "\n即将在所有 compose.yml 文件中执行替换:"
echo "/vol1/1000/ → [新路径] $new_path"
read -p "确认替换？(y/n) " confirm

if [[ $confirm != [yY] ]]; then
  echo "操作已取消"
  exit 1
fi

for i in {1..10}; do
  file="docker-compose-$i.yml"
  if [ -f "$file" ]; then
    sed -i.bak "s#/vol1/1000/#${new_path}#g" "$file"
    echo "已处理文件: $file"
  else
    echo "警告: 文件 $file 不存在，跳过"
  fi
done

file="CreateDir.sh"
if [ -f "$file" ]; then
    sed -i.bak "s#/vol1/1000/#${new_path}#g" "$file"
    echo "已处理文件: $file"
else
    echo "警告: 文件 $file 不存在，跳过"
fi

file="Remove.sh"
if [ -f "$file" ]; then
    sed -i.bak "s#/vol1/1000/#${new_path}#g" "$file"
    echo "已处理文件: $file"
else
    echo "警告: 文件 $file 不存在，跳过"
fi

echo -e "\n替换完成！"
echo "原文件已备份为 .bak 后缀文件"
