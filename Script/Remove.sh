#!/bin/bash

echo -e "\n即将在删除所有服务及文件夹"
read -p "确认替换？(y/n) " confirm

if [[ $confirm != [yY] ]]; then
  echo "操作已取消"
  exit 1
fi

docker stop $(docker ps -aq)

docker rm $(docker ps -aq)

docker rmi $(docker images -aq)

rm -rf /vol1/1000/*/
