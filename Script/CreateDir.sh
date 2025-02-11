#!/bin/bash

mkdir -p /vol1/1000/{Downloads,Frpc,Music,Synchronous,Video,媒体元}

mkdir -p /vol1/1000/Docker/{alist,emulatorjs,homeassistant,iyuuplus,jackett,jellyfin,kkfileview,komga,moviepilot,music-tag-web,navidrome,pdftool,qbittorrent,qinglong,reader,siyuan-note-unlock,sun-panel,transmission,vertex,xiaoya,xunlei}

mkdir -p /vol1/1000/Video/Link/movie /vol1/1000/Video/Link/tv /vol1/1000/Video/movie /vol1/1000/Video/tv

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
    ["/vol1/1000/Docker/jellyfin"]="cache config"
    ["/vol1/1000/Docker/iyuuplus"]="data iyuu"
    ["/vol1/1000/Docker/jackett"]="config downloads"
    ["/vol1/1000/Docker/reader"]="log storage"
    ["/vol1/1000/Docker/komga"]="config data"
    ["/vol1/1000/Docker/pdftool"]="configs tessdata"
    ["/vol1/1000/Docker/emulatorjs"]="config data"
    ["/vol1/1000/Docker/transmission"]="webui"
)

for parent_dir in "${!dir_structure[@]}"; do
    sub_dirs=(${dir_structure[$parent_dir]})
    if ! create_subdirectories "$parent_dir" "${sub_dirs[@]}"; then
        exit 1
    fi
done
