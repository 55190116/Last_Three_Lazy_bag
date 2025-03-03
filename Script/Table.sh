#!/bin/bash

# 定义要输出的信息
declare -a names=("nastools" "moviepilot" "jellyfin" "emby" "qbaittorrent" "transmission" "iyuuplus" "xunlei" "jackett" "apipan" "vertex" "iptv-api" "metatube" "navidrome" "music-tag" "reader" "komga" "wps-office" "verysync" "pdftool" "kkfileview" "siyuan" "alist" "newsnow" "firefox" "npc" "frpc" "v2raya" "sun-panel" "emulatorjs" "teamspeak" "1panel" "qinglong" "homeassistant" "mysql")
declare -a in_package=("No" "Yes" "No" "Yes" "Yes" "Yes" "Yes" "Yes" "No" "Yes" "No" "Yes" "No" "Yes" "Yes" "Yes" "Yes" "No" "Yes" "Yes" "Yes" "Yes" "Yes" "Yes" "Yes" "No" "No" "No" "Yes" "No" "No" "Yes" "Yes" "No" "No")
declare -a usernames=("admin" "admin" "自定义" "自定义" "admin" "root" "自定义" "admin" "无" "无" "admin" "无" "无" "自定义" "admin" "自定义" "自定义" "admin" "自定义" "无" "无" "无" "admin" "无" "无" "无" "无" "自定义" "admin@sun.cc" "无" "无" "自定义" "自定义" "自定义" "无")
declare -a passwords=("password" "运行日志中" "自定义" "自定义" "运行日志中" "root" "自定义" "admin" "无" "无" "data目录下查看" "无" "无" "自定义" "admin" "自定义" "自定义" "admin" "自定义" "无" "无" "无" "运行日志中" "无" "无" "无" "无" "自定义" "12345678" "无" "无" "自定义" "自定义" "自定义" "无")

# 初始化在包内和包外的计数
inside_count=0
outside_count=0

# 输出表头，添加序号列
echo "---------------------------------------------------------"
echo "                     懒人包容器列表                     "
echo "---------------------------------------------------------"
echo "序号  名称        是否在包内    用户名           密码"
echo "---------------------------------------------------------"

# 循环输出每一行信息
for ((i = 0; i < ${#names[@]}; i++)); do
    pass="${passwords[$i]}"
    if [ "$pass" = "自定义" ]; then
        pass="   自定义"
    elif [ "$pass" = "无" ]; then
        pass=" 无"
    fi
    user="${usernames[$i]}"
    if [ "$user" = "无" ]; then
        user="无 "
    fi
    # 输出时添加序号，使用 %-4d 格式化序号，宽度为 4 左对齐
    printf "%-4d %-15s %-10s %-15s %s\n" $((i + 1)) "${names[$i]}" "${in_package[$i]}" "$user" "$pass"

    # 统计在包内和包外的数量
    if [ "${in_package[$i]}" = "Yes" ]; then
        ((inside_count++))
    else
        ((outside_count++))
    fi
done

echo "---------------------------------------------------------"

# 输出统计信息
echo "在包内的数量: $inside_count"
echo "在包外的数量: $outside_count"

echo "---------------------------------------------------------"
