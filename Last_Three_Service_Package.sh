#!/bin/bash

# 清屏
clear

# ANSI 转义序列定义颜色和样式
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m' # 恢复默认样式

# 定义分隔线长度
SEPARATOR_LENGTH=120
SEPARATOR=$(printf "%${SEPARATOR_LENGTH}s" "" | tr " " "=")

# 定义加速链接选项
ACCELERATOR_OPTIONS=(
    "不使用加速链接"
    "使用脚本自带加速链接: https://gh.llkk.cc/"
    "使用脚本自带加速链接: https://ghproxy.cc/"
    "手动输入加速链接"
)

# 显示加速链接选择菜单
function show_accelerator_menu() {
    clear
    show_logo
    echo -e "${YELLOW}${BOLD}请选择加速链接方式：${NC}"
    for i in "${!ACCELERATOR_OPTIONS[@]}"; do
        printf "  ${YELLOW}%-2d. %-15s${NC}\n" $((i + 1)) "${ACCELERATOR_OPTIONS[$i]}"
    done
    echo -e "${BLUE}${BOLD}${SEPARATOR}${NC}"
}

# 检查输入是否为有效的整数
function is_valid_input() {
    local input=$1
    [[ "$input" =~ ^[0-5]$ ]]
}

# 处理加速链接选择
function handle_accelerator_selection() {
    show_accelerator_menu
    read -e -p "请输入选项编号 (0 退出): " choice
    if [ "$choice" -eq 0 ]; then
        echo -e "${GREEN}${BOLD}退出脚本，感谢您对三人行的信赖与支持！${NC}"
        exit 0
    elif [ "$choice" -eq 1 ]; then
        ACCELERATOR=""
    elif [ "$choice" -eq 2 ]; then
        ACCELERATOR="https://gh.llkk.cc/"
    elif [ "$choice" -eq 3 ]; then
        ACCELERATOR="https://ghproxy.cc/"
    elif [ "$choice" -eq 4 ]; then
        read -p "请输入加速链接: " ACCELERATOR
    else
        echo -e "${RED}${BOLD}输入无效，请输入 0 到 4 之间的数字。${NC}"
        sleep 1
        handle_accelerator_selection
    fi
}

# 定义四个加密脚本的下载链接
script_urls=(
    "https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/Last_Three_Lazy_bag.sh.enc"
    "https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/Get_Plugins.sh.enc"
    "https://raw.githubusercontent.com/ATaKi-Myt/Compose_Shop/refs/heads/main/Compose_Shop.sh.enc"
    "https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Script/npc_load.sh.enc"
)

# 对应的友好名称
script_names=(
    "懒人包（一款可以实现系统化安装服务的脚本）"
    "插件包（对懒人包内的插件进行获取的脚本）"
    "Compose 商店（一款可以单独安装 Compose 服务的脚本）"
    "npc 内网穿透一键安装包（三人行内网穿透安装脚本，有偿服务）"
    "Docker Compose 检测（对本 Nas 检测是否安装 Docker Compose）"
)

# 显示 logo 信息
function show_logo() {
    echo -e "${BLUE}${BOLD}${SEPARATOR}${NC}"
    echo ""
    echo -e "${BOLD}${CYAN}  ██╗      █████╗ ███████╗████████╗    ████████╗██╗  ██╗██████╗ ███████╗███████╗${NC}"
    echo -e "${BOLD}${CYAN}  ██║     ██╔══██╗██╔════╝╚══██╔══╝    ╚══██╔══╝██║  ██║██╔══██╗██╔════╝██╔════╝${NC}"
    echo -e "${BOLD}${CYAN}  ██║     ███████║███████╗   ██║          ██║   ███████║██████╔╝█████╗  █████╗  ${NC}"
    echo -e "${BOLD}${CYAN}  ██║     ██╔══██║╚════██║   ██║          ██║   ██╔══██║██╔══██╗██╔══╝  ██╔══╝  ${NC}"
    echo -e "${BOLD}${CYAN}  ███████╗██║  ██║███████║   ██║          ██║   ██║  ██║██║  ██║███████╗███████╗${NC}"
    echo -e "${BOLD}${CYAN}  ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝          ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝${NC}"
    echo ""
    echo -e "${CYAN}    博客地址：bk.010322.xyz  作者微信：M13051661743  脚本版权：三人行    ${NC}"
    echo -e "${CYAN}    一致为小白和重装系统的人，提供最便捷的安装方法，免费提供脚本供大家安装！    ${NC}"
    echo -e "${CYAN}    一切收费贩卖此脚本，均为骗子不要相信！如果想支持作者联系作者微信，还有可以拉进粉丝群哦！    ${NC}"
    echo ""
    echo -e "${BLUE}${BOLD}${SEPARATOR}${NC}"
}

# 显示菜单
function show_menu() {
    clear
    show_logo
    echo -e "${YELLOW}${BOLD}请从以下选项中选择要拉取的脚本：${NC}"
    for i in "${!script_names[@]}"; do
        printf "  ${YELLOW}%-2d. %-15s${NC}\n" $((i + 1)) "${script_names[$i]}"
    done
    echo -e "${BLUE}${BOLD}${SEPARATOR}${NC}"
}

# 下载文件
function download_file() {
    local url="$ACCELERATOR$1"
    local filename=$(basename "$url")
    wget "$url"
    return $?
}

# 解密文件
function decrypt_file() {
    local filename=$1
    local decrypted_filename=$2
    local password=$3
    openssl enc -d -aes-256-cbc -salt -pbkdf2 -iter 100000 -in "$filename" -out "$decrypted_filename" -k "$password"
    return $?
}

# 运行脚本
function run_script() {
    local script=$1
    ./$script
    return $?
}

# 检测 Docker Compose 安装
function check_docker_compose_installed() {
    if docker compose version &> /dev/null
    then
        echo -e "${GREEN}${BOLD}Docker Compose 已安装。${NC}"
    else
        echo -e "${RED}${BOLD}Docker Compose 未安装。${NC}"
        read -p "是否要安装 Docker Compose (y/n): " install_choice
        if [[ $install_choice =~ ^[Yy]$ ]]; then
            echo -e "${BLUE}${BOLD}正在获取 Docker Compose 最新版本号，请稍候...${NC}"
            # 获取最新版本号
            latest_version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
            if [ -z "$latest_version" ]; then
                echo -e "${RED}${BOLD}无法获取 Docker Compose 最新版本号，请检查网络连接。${NC}"
                return 1
            fi
            echo -e "${BLUE}${BOLD}最新版本号为 $latest_version，正在安装 Docker Compose $latest_version，请稍候...${NC}"
            # 安装 Docker Compose 最新版本
            mkdir -p ~/.docker/cli-plugins/
            curl -SL "$ACCELERATORhttps://github.com/docker/compose/releases/download/$latest_version/docker-compose-$(uname -s)-$(uname -m)" -o ~/.docker/cli-plugins/docker-compose
            chmod +x ~/.docker/cli-plugins/docker-compose
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}${BOLD}Docker Compose $latest_version 安装成功。${NC}"
            else
                echo -e "${RED}${BOLD}Docker Compose $latest_version 安装失败，请检查网络或手动安装。${NC}"
            fi
        else
            echo -e "${YELLOW}您选择不安装 Docker Compose，继续回到选择菜单。${NC}"
        fi
    fi
}

# 处理脚本下载、解密和运行
function handle_script_selection() {
    local choice=$1
    local selected_url=${script_urls[$((choice - 1))]}
    local filename=$(basename "$selected_url")
    local decrypted_filename="${filename%.enc}"

    if [ -f "$decrypted_filename" ]; then
        echo -e "${YELLOW}${BOLD}文件 $decrypted_filename 已存在且已解密，跳过下载和解密步骤，直接运行脚本。${NC}"
    else
        read -s -p "请从作者处获取解密密码并输入: " password
        echo

        echo -e "${BLUE}${BOLD}正在为您拉取脚本，请稍候...${NC}"
        if ! download_file "$selected_url"; then
            echo -e "${RED}${BOLD}脚本拉取失败，请检查网络连接或 URL。${NC}"
            return 1
        fi

        if [ ! -f "$filename" ]; then
            echo -e "${RED}${BOLD}文件 $filename 未成功下载，请检查网络或源地址。${NC}"
            return 1
        fi

        echo -e "${BLUE}${BOLD}正在解密脚本，请耐心等待...${NC}"
        if ! decrypt_file "$filename" "$decrypted_filename" "$password"; then
            echo -e "${RED}${BOLD}脚本解密失败，请检查密码是否正确。${NC}"
            return 1
        fi

        if [ ! -f "$decrypted_filename" ]; then
            echo -e "${RED}${BOLD}解密后的文件 $decrypted_filename 不存在，请检查解密过程。${NC}"
            return 1
        fi

        echo -e "${GREEN}${BOLD}脚本解密成功：$decrypted_filename${NC}"
        chmod +x "$decrypted_filename"
    fi

    echo -e "${BLUE}${BOLD}正在运行脚本 $decrypted_filename ...${NC}"
    if ! run_script "$decrypted_filename"; then
        local run_status=$?
        if [ $run_status -eq 126 ]; then
            echo -e "${RED}${BOLD}脚本 $decrypted_filename 无法执行，可能是权限问题或文件格式问题。${NC}"
        elif [ $run_status -eq 127 ]; then
            echo -e "${RED}${BOLD}脚本 $decrypted_filename 未找到，请检查文件是否存在。${NC}"
        else
            echo -e "${RED}${BOLD}脚本 $decrypted_filename 运行失败，请检查脚本内容。${NC}"
        fi
        return 1
    else
        echo -e "${GREEN}${BOLD}脚本 $decrypted_filename 运行成功。${NC}"
        return 0
    fi
}

# 处理加速链接选择
handle_accelerator_selection

while true; do
    show_menu
    read -e -p "请输入选项编号 (0 退出): " choice

    # 修改为允许输入 0 - 5
    if ! is_valid_input "$choice"; then
        echo -e "${RED}${BOLD}输入无效，请输入 0 到 5 之间的数字。${NC}"
        sleep 1
        continue
    fi

    if [ "$choice" -eq 0 ]; then
        echo -e "${GREEN}${BOLD}退出脚本，感谢您对三人行的信赖与支持！${NC}"
        break
    fi

    if [ "$choice" -eq 5 ]; then
        check_docker_compose_installed
        echo -e "${YELLOW}按任意键继续回到选择界面...${NC}"
        read -n 1 -s -r
        tput reset
        continue
    fi

    if ! handle_script_selection "$choice"; then
        echo -e "${YELLOW}按任意键继续回到选择界面...${NC}"
        read -n 1 -s -r
        tput reset
    fi
done
