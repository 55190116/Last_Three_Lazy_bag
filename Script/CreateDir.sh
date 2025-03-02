#!/bin/bash

# 创建基础目录
mkdir -p /vol1/1000/{Downloads,Music,Synchronous,Video,媒体元}

# 创建 Docker 相关目录，去掉目录名中的空格
mkdir -p /vol1/1000/Docker/{nastools,moviepilot,jellyfin,emby,qbittorrent,transmission,iyuuplus,xunlei,jackett,vertex,iptv-api,navidrome,music-tag-web,reader,komga,wps-office,pdftool,kkfileview,siyuan-note-unlock,alist,firefox,npc,v2raya,sun-panel,emulatorjs,teamspeak,1panel,qinglong,homeassistant,mysql}

# 创建 Video 相关子目录
mkdir -p /vol1/1000/Video/{Link/{movie,tv},movie,tv,MakeTorrent}

# 定义目录结构关联数组
declare -A dir_structure=(
    ["/vol1/1000/Docker/jellyfin"]="config cache"
    ["/vol1/1000/Docker/emby"]="config"
    ["/vol1/1000/Docker/iyuuplus"]="iyuu data"
    ["/vol1/1000/Docker/jackett"]="config downloads"
    ["/vol1/1000/Docker/iptv-api"]="config output"
    ["/vol1/1000/Docker/reader"]="log storage"
    ["/vol1/1000/Docker/komga"]="config data"
    ["/vol1/1000/Docker/wps-office"]="config Desktop Fonts"
    ["/vol1/1000/Docker/pdftool"]="trainingData extraConfigs customFiles logs pipeline"
    ["/vol1/1000/Docker/firefox"]="config fonts"
    ["/vol1/1000/Docker/emulatorjs"]="config data"
)

# 遍历目录结构关联数组，创建子目录
for parent in "${!dir_structure[@]}"; do
    for sub in ${dir_structure[$parent]}; do
        path="$parent/$sub"
        if ! mkdir -p "$path"; then
            echo "创建目录 $path 失败，可能是权限问题，请检查！" >&2
            exit 1
        fi
    done
done

# 提示创建完成
echo "所有目录创建完成！"
