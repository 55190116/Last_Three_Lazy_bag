#!/bin/bash

correct_password="Yt20010322."

read -s -p "请输入密码: " user_password
echo

if [ "$user_password" = "$correct_password" ]; then
    echo "密码正确"
	echo "欢迎来到三人行懒人包安装脚本！"
	echo "请选择要运行的 compose 文件："
	echo "1. 安装全部服务"
	echo "2. 仅安装视频服务 nastool 、 jellyfin 、 qbittorrent 、 transmission 、 iyuuplus 、 xunlei 、jackett 、 alist-tvbox 、 aipan "
	echo "3. 仅安装音乐服务 navidrome music-tag-web "
	echo "4. 仅安装小说服务 reader "
	echo "5. 仅安装漫画服务 komga "
	echo "6. 仅安装办公服务 WPS 、 微力同步 、 PDF工具箱 、 在线预览文件" 
	echo "7. 仅安装网络服务 v2raya 、 frpc"
	echo "8. 仅安装娱乐服务 GBA模拟器 "
	echo "9. 创建其余文件夹 Video子目录 、 媒体源目录"
	echo "0. 退出三人行懒人包安装脚本"

	while true; do
    	read -p "请输入安装服务序号(1-9 或 0)：" choice
    
    	if [[ $choice =~ ^[0-9]$ && $choice -le 9 ]]; then
        	if [ $choice -eq 0 ]; then
            	echo "已退出三人行懒人包安装脚本！。"
            	exit 0
        	else
            	break
        	fi
    	else
        	echo "输入错误！请输入有效安装服务序号！(1-9 或 0)："
    	fi
	done

    case $choice in
        1)
            echo "正在安装全部服务"
            docker compose -f docker-compose-1.yml up -d
            ;;
        2)
            echo "正在安装视频服务"
            docker compose -f docker-compose-2.yml up -d
            ;;
        3)
            echo "正在安装音乐服务"
            docker compose -f docker-compose-3.yml up -d
            ;;
        4)
            echo "正在安装小说服务"
            docker compose -f docker-compose-4.yml up -d
            ;;
        5)
            echo "正在安装漫画服务"
            docker compose -f docker-compose-5.yml up -d
            ;;
        6)
            echo "正在安装办公服务"
            docker compose -f docker-compose-5.yml up -d
            ;;
        7)
            echo "正在安装网络服务"
            docker compose -f docker-compose-5.yml up -d
            ;;
        8)
            echo "正在安装娱乐服务"
            docker compose -f docker-compose-5.yml up -d
            ;;
        9)
            echo "正在创建其余文件夹"
            bash mkdir.sh
            ;;
    esac
else
    echo "密码错误，退出脚本。"
    exit 1  # 退出脚本，返回非零状态码表示错误
fi

wget -O compose1.yml --no-check-certificate https://raw.githubusercontent.com/ATaKi-Myt/gitdemo/refs/heads/main/docker-compose.yml