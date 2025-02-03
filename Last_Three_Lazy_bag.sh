#!/bin/bash

correct_password="Yt20010322."
read -s -p "请输入密码: " user_password
echo

if [ "$user_password" = "$correct_password" ]; then
    echo "密码正确"
    echo "欢迎来到三人行懒人包安装脚本！第一次运行请优先运行更改目录服务，并下载Compose文件！"

    files=(
         "docker-compose-1.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Compose/docker-compose-1.yml"
         "docker-compose-2.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Compose/docker-compose-2.yml"
         "docker-compose-3.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Compose/docker-compose-3.yml"
	 "docker-compose-4.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Compose/docker-compose-4.yml"
	 "docker-compose-5.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Compose/docker-compose-5.yml"
	 "docker-compose-6.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Compose/docker-compose-6.yml"
	 "docker-compose-7.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Compose/docker-compose-7.yml"
	 "docker-compose-8.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Compose/docker-compose-8.yml"
	 "docker-compose-9.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Compose/docker-compose-9.yml"
	 "CreateDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Bash/CreateDir.sh"
	 "ModifyDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Bash/ModifyDir.sh"
  	 "Remove.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Bash/Remove.sh"
    )

    for file_info in "${files[@]}"; do
	IFS=' ' read -r filename url <<< "$file_info"
	if [ ! -e "$filename" ]; then
	    wget -O "$filename" --no-verbose --no-check-certificate "$url"
	else
	    echo "文件 $filename 已存在，跳过下载。"
	fi
    done

    # 定义函数：更改根目录文件夹
    function install_modify_dir_service() {
        echo "正在更改根目录文件夹"
        bash ModifyDir.sh
    }

    # 定义函数：安装全部服务
    function install_all_service() {
        echo "正在安装全部服务"
        docker compose -f docker-compose-1.yml up -d
    }

    # 定义函数：安装视频服务
    function install_video_service() {
        echo "正在安装视频服务"
        docker compose -f docker-compose-2.yml up -d
    }

    # 定义函数：安装音乐服务
    function install_music_service() {
        echo "正在安装音乐服务"
        docker compose -f docker-compose-3.yml up -d
    }

    # 定义函数：安装小说服务
    function install_novel_service() {
        echo "正在安装小说服务"
        docker compose -f docker-compose-4.yml up -d
    }

    # 定义函数：安装漫画服务
    function install_comic_service() {
        echo "正在安装漫画服务"
        docker compose -f docker-compose-5.yml up -d
    }

    # 定义函数：安装办公服务
    function install_office_service() {
        echo "正在安装办公服务"
        docker compose -f docker-compose-6.yml up -d
    }

    # 定义函数：安装网络服务
    function install_network_service() {
        echo "正在安装网络服务"
        docker compose -f docker-compose-7.yml up -d
    }

    # 定义函数：安装美化服务
    function install_beautify_service() {
        echo "正在安装美化服务"
        docker compose -f docker-compose-8.yml up -d
    }

    # 定义函数：安装娱乐服务（GBA模拟器）
    function install_game_service() {
        echo "正在安装游戏服务"
        docker compose -f docker-compose-9.yml up -d
    }

    # 定义函数：创建其余文件夹
    function install_create_dir_service() {
        echo "正在创建其余文件夹"
        bash CreateDir.sh
    }

    # 定义函数：删除本地所有服务及文件夹
    function install_remove_service() {
        echo "正在删除本地所有服务及文件夹"
        bash Remove.sh
    }

    echo "---------------------------------------- 博客地址：blog.010322.xyz -----------------------------------------------------------------"
    echo "请选择要运行的服务："
    echo "1.   更改根目录文件夹"
    echo "2.   安装全部服务"
    echo "3.   仅安装视频服务 nastool 、 jellyfin 、 qbittorrent 、 transmission 、 iyuuplus 、 xunlei 、jackett 、 alist-tvbox 、 aipan "
    echo "4.   仅安装音乐服务 navidrome music-tag-web "
    echo "5.   仅安装小说服务 reader "
    echo "6.   仅安装漫画服务 komga "
    echo "7.   仅安装办公服务 WPS 、 微力同步 、 PDF工具箱 、 在线预览文件"
    echo "8.   仅安装网络服务 v2raya 、 frpc"
    echo "9.   仅安装美化服务 sun-panel "
    echo "10.  仅安装娱乐服务 GBA模拟器 "
    echo "11.  创建其余文件夹 Video子目录 、 媒体源目录"
    echo "12.  删除本地所有服务及文件夹"
    echo "0.   退出三人行懒人包安装脚本"
    echo "---------------------------------------- 博客地址：blog.010322.xyz -----------------------------------------------------------------"
    
    while true; do
        read -p "请输入安装服务序号(0-12)：" choice
        if [[ $choice =~ ^[0-9]{1,2}$ && $choice -le 12 ]]; then
            if [ $choice -eq 0 ]; then
                echo "已退出三人行懒人包安装脚本！"
                exit 0
            else
                case $choice in
                    1)
                        install_modify_dir_service
                        ;;
                    2)
                        install_all_service
                        ;;
                    3)
                        install_video_service
                        ;;
                    4)
                        install_music_service
                        ;;
                    5)
                        install_novel_service
                        ;;
                    6)
                        install_comic_service
                        ;;
                    7)
                        install_office_service
                        ;;
                    8)
                        install_network_service
                        ;;
                    9)
                        install_beautify_service
                        ;;
                    10)
                        install_game_service
                        ;;
                    11)
                        install_create_dir_service
                        ;;
                    12)
                        install_remove_service
                        ;;
                esac
		echo "---------------------------------------- 博客地址：blog.010322.xyz -----------------------------------------------------------------"
		echo "请选择要运行的服务："
		echo "1.   更改根目录文件夹"
		echo "2.   安装全部服务"
		echo "3.   仅安装视频服务 nastool 、 jellyfin 、 qbittorrent 、 transmission 、 iyuuplus 、 xunlei 、jackett 、 alist-tvbox 、 aipan "
		echo "4.   仅安装音乐服务 navidrome music-tag-web "
		echo "5.   仅安装小说服务 reader "
		echo "6.   仅安装漫画服务 komga "
		echo "7.   仅安装办公服务 WPS 、 微力同步 、 PDF工具箱 、 在线预览文件"
		echo "8.   仅安装网络服务 v2raya 、 frpc"
		echo "9.   仅安装美化服务 sun-panel "
		echo "10.  仅安装娱乐服务 GBA模拟器 "
		echo "11.  创建其余文件夹 Video子目录 、 媒体源目录"
		echo "12.  删除本地所有服务及文件夹"
		echo "0.   退出三人行懒人包安装脚本"
		echo "---------------------------------------- 博客地址：blog.010322.xyz -----------------------------------------------------------------"
            fi
        else
            echo "输入错误！请输入有效安装服务序号(0-12)！"
        fi
    done
else
    echo "密码错误，退出脚本。"
    exit 1  # 退出脚本，返回非零状态码表示错误
fi
