#!/bin/bash

correct_password="Yt20010322."
read -s -p "请输入密码: " user_password
echo

if [ "$user_password" = "$correct_password" ]; then
    echo "密码正确"
    echo "欢迎来到三人行懒人包安装脚本！"
    echo "懒人包支持镜像源：https://docker.1ms.run"
    echo "懒人包本地镜像包下载地址：https://pan.baidu.com/s/1C-CHLbQqcePxSYR0xlxLwQ?pwd=tksy"
    echo "---------------------------------------- 博客地址：blog.010322.xyz -----------------------------------------------------------------"
    echo "请选择安装系统："
    echo "1. 飞牛系统"
    echo "2. 群晖系统"
    echo "3. 绿联（旧系统）"
    echo "4. 绿联（新系统）"
    echo "5. 极空间（暂不支持）"  
    while true; do
        read -p "请输入系统序号(1-5)：" version_choice
        if [[ $version_choice =~ ^[1-5]$ ]]; then
            case $version_choice in
                1)
                    version="飞牛系统"
                    break
                    ;;
                2)
                    version="群晖系统"
                    break
                    ;;
                3)
                    version="绿联（旧系统）"
                    break
                    ;;
                4)
                    version="绿联（新系统）"
                    break
                    ;;
                5)
                    version="极空间（暂不支持）"
                    break
                    ;;
            esac
        else
            echo "输入错误！请输入有效系统序号(1-5)！"
        fi
    done
    echo "你选择的系统是：$version （第一次运行需要下载 .yml 和 .sh 文件）"

    if [ "$version" = "飞牛系统" ]; then
        files=(
            "docker-compose-1.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-1.yml"
            "docker-compose-2.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-2.yml"
            "docker-compose-3.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-3.yml"
            "docker-compose-4.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-4.yml"
            "docker-compose-5.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-5.yml"
            "docker-compose-6.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-6.yml"
            "docker-compose-7.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-7.yml"
            "docker-compose-8.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-8.yml"
            "docker-compose-9.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-9.yml"
            "docker-compose-10.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/fnOS/docker-compose-10.yml"
            "CreateDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/CreateDir.sh"
            "ModifyDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/ModifyDir.sh"
            "Remove.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/Remove.sh"
        )
    elif [ "$version" = "群晖系统" ]; then
        files=(
	    "docker-compose-1.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-1.yml"
     	    "docker-compose-2.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-2.yml"
            "docker-compose-3.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-3.yml"
            "docker-compose-4.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-4.yml"
            "docker-compose-5.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-5.yml"
            "docker-compose-6.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-6.yml"
            "docker-compose-7.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-7.yml"
            "docker-compose-8.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-8.yml"
            "docker-compose-9.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-9.yml"
            "docker-compose-10.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Synology/docker-compose-10.yml"
	    "CreateDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/CreateDir.sh"
            "ModifyDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/ModifyDir.sh"
            "Remove.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/Remove.sh"
        )
    elif [ "$version" = "绿联（旧系统）" ]; then
        files=(
	    "docker-compose-1.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-1.yml"
     	    "docker-compose-2.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-2.yml"
            "docker-compose-3.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-3.yml"
            "docker-compose-4.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-4.yml"
            "docker-compose-5.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-5.yml"
            "docker-compose-6.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-6.yml"
            "docker-compose-7.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-7.yml"
            "docker-compose-8.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-8.yml"
            "docker-compose-9.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-9.yml"
            "docker-compose-10.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Ugreen/docker-compose-10.yml"
	    "CreateDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/CreateDir.sh"
            "ModifyDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/ModifyDir.sh"
            "Remove.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/Remove.sh"
        )
    elif [ "$version" = "绿联（新系统）" ]; then
        files=(
	    "docker-compose-1.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-1.yml"
     	    "docker-compose-2.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-2.yml"
            "docker-compose-3.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-3.yml"
            "docker-compose-4.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-4.yml"
            "docker-compose-5.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-5.yml"
            "docker-compose-6.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-6.yml"
            "docker-compose-7.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-7.yml"
            "docker-compose-8.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-8.yml"
            "docker-compose-9.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-9.yml"
            "docker-compose-10.yml https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/UgreenNew/docker-compose-10.yml"
	    "CreateDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/CreateDir.sh"
            "ModifyDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/ModifyDir.sh"
            "Remove.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/Remove.sh"
        )
    elif [ "$version" = "极空间（暂不支持）" ]; then
        files=(
	    "CreateDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/CreateDir.sh"
            "ModifyDir.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/ModifyDir.sh"
            "Remove.sh https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/Remove.sh"
        )
    fi

    for file_info in "${files[@]}"; do
        IFS=' ' read -r filename url <<< "$file_info"
        if [ ! -e "$filename" ]; then
            wget -O "$filename" --no-verbose --no-check-certificate "$url"
        fi
    done

    function install_modify_dir_service() {
        echo "正在更改根目录文件夹"
        bash ModifyDir.sh
    }

    function install_all_service() {
        echo "正在安装全部服务"
        docker compose -f docker-compose-1.yml up -d
    }

    function install_video_service() {
        echo "正在安装视频服务"
        docker compose -f docker-compose-2.yml up -d
    }

    function install_music_service() {
        echo "正在安装音乐服务"
        docker compose -f docker-compose-3.yml up -d
    }

    function install_novel_service() {
        echo "正在安装小说服务"
        docker compose -f docker-compose-4.yml up -d
    }

    function install_comic_service() {
        echo "正在安装漫画服务"
        docker compose -f docker-compose-5.yml up -d
    }

    function install_office_service() {
        echo "正在安装办公服务"
        docker compose -f docker-compose-6.yml up -d
    }

    function install_network_service() {
        echo "正在安装网络服务"
        docker compose -f docker-compose-7.yml up -d
    }

    function install_beautify_service() {
        echo "正在安装美化服务"
        docker compose -f docker-compose-8.yml up -d
    }

    function install_game_service() {
        echo "正在安装游戏服务"
        docker compose -f docker-compose-9.yml up -d
    }

    function install_system_service() {
        echo "正在安装系统服务"
        docker compose -f docker-compose-10.yml up -d
    }

    function install_create_dir_service() {
        echo "正在创建其余文件夹"
        bash CreateDir.sh
    }

    function install_remove_service() {
        echo "正在删除本地所有服务及文件夹"
        bash Remove.sh
    }

    echo "---------------------------------------- 博客地址：blog.010322.xyz -----------------------------------------------------------------"
    echo "请选择要运行的服务（请先执行1和2）："
    echo "1.   更改根目录文件夹"
    echo "2.   创建根目录文件夹" 
    echo "3.   安装全部服务"
    echo "4.   仅安装视频服务 moviepilot 、 jellyfin 、 qbittorrent 、 transmission 、 iyuuplus 、 xunlei 、jackett 、 alist-tvbox 、 aipan "
    echo "5.   仅安装音乐服务 navidrome 、 music-tag-web "
    echo "6.   仅安装小说服务 reader "
    echo "7.   仅安装漫画服务 komga "
    echo "8.   仅安装办公服务 WPS 、 微力同步 、 PDF工具箱 、 在线预览文件 、 思源笔记 、 Alist 、 newsnow"
    echo "9.   仅安装网络服务 npc 、 v2raya 、 frpc"
    echo "10.  仅安装美化服务 sun-panel "
    echo "11.  仅安装娱乐服务 GBA模拟器 "
    echo "12.  仅安装系统服务 1panel 、 青龙面板 、 Home Assistant "
    echo "13.  删除本地所有服务及文件夹"
    echo "0.   退出三人行懒人包安装脚本"
    echo "---------------------------------------- 博客地址：blog.010322.xyz -----------------------------------------------------------------"
    
    while true; do
        read -p "请输入安装服务序号(0-13)：" choice
        if [[ $choice =~ ^[0-9]{1,2}$ && $choice -le 13 ]]; then
            if [ $choice -eq 0 ]; then
                echo "已退出三人行懒人包安装脚本！"
                exit 0
            else
                case $choice in
                    1)
                        install_modify_dir_service
                        ;;
                    2)
                        install_create_dir_service
                        ;;
                    3)
                        install_all_service
                        ;;
                    4)
                        install_video_service
                        ;;
                    5)
                        install_music_service
                        ;;
                    6)
                        install_novel_service
                        ;;
                    7)
                        install_comic_service
                        ;;
                    8)
                        install_office_service
                        ;;
                    9)
                        install_network_service
                        ;;
                    10)
                        install_beautify_service
                        ;;
                    11)
                        install_game_service
                        ;;
                    12)
                        install_system_service
                        ;;
                    13)
                        install_remove_service
                        ;;
                esac
                echo "---------------------------------------- 博客地址：blog.010322.xyz -----------------------------------------------------------------"
                echo "请选择要运行的服务（请先执行1和2）："
                echo "1.   更改根目录文件夹"
                echo "2.   创建根目录文件夹" 
                echo "3.   安装全部服务"
                echo "4.   仅安装视频服务 moviepilot 、 jellyfin 、 qbittorrent 、 transmission 、 iyuuplus 、 xunlei 、jackett 、 alist-tvbox 、 aipan "
                echo "5.   仅安装音乐服务 navidrome 、 music-tag-web "
                echo "6.   仅安装小说服务 reader "
                echo "7.   仅安装漫画服务 komga "
                echo "8.   仅安装办公服务 WPS 、 微力同步 、 PDF工具箱 、 在线预览文件 、 思源笔记 、 Alist 、 newsnow"
                echo "9.   仅安装网络服务 npc 、 v2raya 、 frpc"
                echo "10.  仅安装美化服务 sun-panel "
                echo "11.  仅安装娱乐服务 GBA模拟器 "
                echo "12.  仅安装系统服务 1panel 、 青龙面板 、 Home Assistant "
                echo "13.  删除本地所有服务及文件夹"
                echo "0.   退出三人行懒人包安装脚本"
                echo "---------------------------------------- 博客地址：blog.010322.xyz -----------------------------------------------------------------"
            fi
        else
            echo "输入错误！请输入有效安装服务序号(0-13)！"
        fi
    done
else
    echo "密码错误，退出脚本。"
    exit 1  # 退出脚本，返回非零状态码表示错误
fi
