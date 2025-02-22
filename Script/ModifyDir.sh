#!/bin/bash

echo "飞牛路径示例：/vol*/1000/"
echo "群晖路径示例：/volume*/My/ My：根路径名称"
echo "绿联旧系统路径示例：/mnt/dm-*/.ugreen_nas/509155/ 509155：用户文件名"
echo "绿联新系统路径示例：/volume*/@home/My/ My：根路径名称"
echo "所有 * 均改为自己对应的数字"
read -p "请输入替换后的新路径: " new_path

echo -e "\n即将在所有 compose.yml 文件中执行替换:"
echo "/vol1/1000/ → [新路径] $new_path"
echo "/mnt/dm-1/.ugreen_nas/509155/ → [新路径] $new_path"
echo "/volume1/My/ → [新路径] $new_path"
echo "/volume1/@home/Testroot/ → [新路径] $new_path"
read -p "确认替换？(y/n) " confirm

if [[ $confirm != [yY] ]]; then
  echo "操作已取消"
  exit 1
fi

# 定义要替换的目录列表
old_paths=(
  "/vol1/1000/"
  "/mnt/dm-1/.ugreen_nas/509155/"
  "/volume1/My/"
  "/volume1/@home/Testroot/"
)

# 处理 docker-compose-1.yml 到 docker-compose-10.yml 文件
for i in {1..10}; do
  file="docker-compose-$i.yml"
  if [ -f "$file" ]; then
    for old_path in "${old_paths[@]}"; do
      sed -i.bak "s#${old_path}#${new_path}#g" "$file"
    done
    echo "已处理文件: $file"
  else
    echo "警告: 文件 $file 不存在，跳过"
  fi
done

# 处理 CreateDir.sh 文件
file="CreateDir.sh"
if [ -f "$file" ]; then
  for old_path in "${old_paths[@]}"; do
    sed -i.bak "s#${old_path}#${new_path}#g" "$file"
  done
  echo "已处理文件: $file"
else
  echo "警告: 文件 $file 不存在，跳过"
fi

# 处理 Remove.sh 文件
file="Remove.sh"
if [ -f "$file" ]; then
  for old_path in "${old_paths[@]}"; do
    sed -i.bak "s#${old_path}#${new_path}#g" "$file"
  done
  echo "已处理文件: $file"
else
  echo "警告: 文件 $file 不存在，跳过"
fi

echo -e "\n替换完成！"
echo "原文件已备份为 .bak 后缀文件"
