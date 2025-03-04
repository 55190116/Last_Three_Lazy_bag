#!/bin/bash

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

# 定义三个加密脚本的下载链接
script_urls=(
    "https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Last_Three_Lazy_bag.sh.enc"
    "https://example.com/plugin_package.sh.enc"
    "https://raw.githubusercontent.com/ATaKi-Myt/Compose_Shop/refs/heads/main/Compose_Shop.sh.enc"
)

# 对应的友好名称
script_names=(
    "懒人包（一款可以实现系统话安装服务的脚本）"
    "插件包（对懒人包内的插件进行获取的脚本）"
    "Compose商店（一款可以单独安装Compose服务的脚本）"
)

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

function show_menu() {
    clear
    show_logo
    echo -e "${YELLOW}${BOLD}请从以下选项中选择要拉取的脚本：${NC}"
    for i in "${!script_names[@]}"; do
        printf "  ${YELLOW}%-2d. %-15s${NC}\n" $((i + 1)) "${script_names[$i]}"
    done
    echo -e "${BLUE}${BOLD}${SEPARATOR}${NC}"
}

while true; do
    show_menu
    # 获取用户选择
    read -p "请输入选项编号 (0 退出): " choice

    # 检查输入是否为有效的整数
    if ! [[ "$choice" =~ ^[0-3]$ ]]; then
        echo -e "${RED}${BOLD}输入无效，请输入 0 到 ${#script_urls[@]} 之间的数字。${NC}"
        sleep 1  # 等待 1 秒让用户看到提示
        continue
    fi

    # 处理退出选择
    if [ "$choice" -eq 0 ]; then
        echo -e "${GREEN}${BOLD}退出脚本，感谢您对三人行的信赖与支持！${NC}"
        break
    fi

    # 获取所选脚本的 URL
    selected_url=${script_urls[$((choice - 1))]}

    # 提示用户输入解密密码
    read -s -p "请从作者处获取密码并输入: " password
    echo

    echo -e "${BLUE}${BOLD}正在为您拉取脚本，请稍候...${NC}"
    # 拉取所选脚本
    filename=$(basename "$selected_url")
    wget "$selected_url"

    # 检查 wget 是否成功
    if [ $? -ne 0 ]; then
        echo -e "${RED}${BOLD}脚本拉取失败，请检查网络连接或 URL。${NC}"
        echo -e "${YELLOW}按任意键继续回到选择界面...${NC}"
        read -n 1 -s -r
        tput reset
        continue
    fi

    echo -e "${BLUE}${BOLD}正在解密脚本，请耐心等待...${NC}"
    # 解密脚本
    decrypted_filename="${filename%.enc}"
    openssl enc -d -aes-256-cbc -salt -pbkdf2 -iter 100000 -in "$filename" -out "$decrypted_filename" -k "$password"

    # 检查解密是否成功
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}${BOLD}脚本解密成功：$decrypted_filename${NC}"
        chmod +x "$decrypted_filename"
    else
        echo -e "${RED}${BOLD}脚本解密失败，请检查密码是否正确。${NC}"
    fi

    echo -e "${YELLOW}按任意键继续回到选择界面...${NC}"
    read -n 1 -s -r
    tput reset
done
