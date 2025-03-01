#!/bin/bash

mkdir -p /vol1/1000/{Downloads,Music,Synchronous,Video,媒体元}

mkdir -p /vol1/1000/Docker/{nastools,moviepilot,jellyfin,emby,qbittorrent,transmission,iyuuplus,xunlei,jackett,vertex,iptv-api,navidrome,music-tag-web,reader,komga,wps-office,pdftool,kkfileview,siyuan-note-unlock,alist,firefox,npc,v2raya,sun-panel,emulatorjs,teamspeak,1panel,qinglong,homeassistant,mysql}

mkdir -p /vol1/1000/Video/Link/movie /vol1/1000/Video/Link/tv /vol1/1000/Video/movie /vol1/1000/Video/tv /vol1/1000/Video/MakeTorrent

create_subdirectories() {
    local parent_dir="$1"
    shift
    local sub_dirs=("$@")
    for sub_dir in "${sub_dirs[@]}"; do
        local full_path="${parent_dir}/${sub_dir}"
        mkdir -p "$full_path"
        if [ $? -ne 0 ]; then
            echo "创建目录 $full_path 失败" >&2
            return 1
        fi
    done
    return 0
}

declare -A dir_structure=(
    ["/vol1/1000/Docker/jellyfin"]="config cache"
    ["/vol1/1000/Docker/emby"]="config"
    ["/vol1/1000/Docker/iyuuplus"]="iyuu data"
    ["/vol1/1000/Docker/jackett"]="config downloads"
    ["/vol1/1000/Docker/iptv-api"]="config output"
    ["/vol1/1000/Docker/reader"]="log storage"
    ["/vol1/1000/Docker/komga"]="config data"
    ["/vol1/1000/Docker/wps-office"]="config Desktop"
    ["/vol1/1000/Docker/pdftool"]="trainingData extraConfigs customFiles logs pipeline"
    ["/vol1/1000/Docker/firefox"]="config fonts"
    ["/vol1/1000/Docker/emulatorjs"]="config data"
)

for parent_dir in "${!dir_structure[@]}"; do
    sub_dirs=(${dir_structure[$parent_dir]})
    if ! create_subdirectories "$parent_dir" "${sub_dirs[@]}"; then
        exit 1
    fi
done
