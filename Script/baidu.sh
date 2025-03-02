#!/bin/bash

# 定义变量，方便后续修改和使用
DOWNLOAD_DIR="/usr/local/bin"
DOWNLOAD_URL="https://github.com/qjfoidnh/BaiduPCS-Go/releases/download/v3.9.7/BaiduPCS-Go-v3.9.7-linux-amd64.zip"
ZIP_FILE="${DOWNLOAD_DIR}/$(basename ${DOWNLOAD_URL})"
EXTRACT_DIR="${DOWNLOAD_DIR}/$(basename ${DOWNLOAD_URL} .zip)"
TARGET_BINARY="${DOWNLOAD_DIR}/BaiduPCS-Go"

# 切换到下载目录
if ! cd "$DOWNLOAD_DIR"; then
    echo "无法切换到目录 $DOWNLOAD_DIR" >&2
    exit 1
fi

# 下载文件
if ! wget "$DOWNLOAD_URL"; then
    echo "下载 $DOWNLOAD_URL 失败" >&2
    exit 1
fi

# 解压文件
if ! unzip "$ZIP_FILE"; then
    echo "解压 $ZIP_FILE 失败" >&2
    # 清理已下载的压缩包
    rm -f "$ZIP_FILE"
    exit 1
fi

# 检查解压后的目录是否存在
if [ ! -d "$EXTRACT_DIR" ]; then
    echo "解压后的目录 $EXTRACT_DIR 不存在" >&2
    # 清理已下载的压缩包
    rm -f "$ZIP_FILE"
    exit 1
fi

# 切换到解压后的目录
if ! cd "$EXTRACT_DIR"; then
    echo "无法切换到目录 $EXTRACT_DIR" >&2
    # 清理已下载的压缩包和解压目录
    rm -f "$ZIP_FILE"
    rm -rf "$EXTRACT_DIR"
    exit 1
fi

# 检查要移动的文件是否存在
if [ ! -f "BaiduPCS-Go" ]; then
    echo "未找到 BaiduPCS-Go 文件" >&2
    # 清理已下载的压缩包和解压目录
    rm -f "$ZIP_FILE"
    rm -rf "$EXTRACT_DIR"
    exit 1
fi

# 移动文件到目标目录
if ! mv "BaiduPCS-Go" "$TARGET_BINARY"; then
    echo "移动 BaiduPCS-Go 到 $TARGET_BINARY 失败" >&2
    # 清理已下载的压缩包和解压目录
    rm -f "$ZIP_FILE"
    rm -rf "$EXTRACT_DIR"
    exit 1
fi

# 清理下载的压缩包和解压目录
rm -f "$ZIP_FILE"
rm -rf "$EXTRACT_DIR"

# 为可执行文件添加执行权限
if ! chmod +x "$TARGET_BINARY"; then
    echo "为 $TARGET_BINARY 添加执行权限失败" >&2
    exit 1
fi

# 检查 BaiduPCS-Go 版本
if ! "$TARGET_BINARY" -v; then
    echo "执行 $TARGET_BINARY -v 失败" >&2
    exit 1
fi

echo "BaiduPCS-Go 安装并验证版本成功"

# 选择最大并行下载数量
while true; do
    read -p "请选择最大并行下载数量（1: 普通用户设置为1；2: SVIP用户设置为20）: " CHOICE
    case $CHOICE in
        1)
            MAX_PARALLEL=1
            break
            ;;
        2)
            MAX_PARALLEL=20
            break
            ;;
        *)
            echo "无效的选择，请输入 1 或 2。"
            ;;
    esac
done

# 设置最大并行下载数量
echo "正在设置最大并行下载数量为 $MAX_PARALLEL..."
if ! "$TARGET_BINARY" config set -max_parallel=$MAX_PARALLEL; then
    echo "设置最大并行下载数量失败" >&2
    exit 1
fi

echo "最大并行下载数量已成功设置为 $MAX_PARALLEL"

# 提示用户输入 BDUSS
read -p "请输入你的 BDUSS 以登录百度账号: " BDUSS

# 检查用户是否输入了 BDUSS
if [ -z "$BDUSS" ]; then
    echo "未输入有效的 BDUSS，登录取消。" >&2
    exit 1
fi

# 使用 BaiduPCS-Go 进行登录
echo "正在使用输入的 BDUSS 进行登录..."
if ! "$TARGET_BINARY" login -bduss="$BDUSS"; then
    echo "使用 BDUSS 登录百度账号失败。" >&2
    exit 1
fi

echo "使用 BDUSS 登录百度账号成功。"

# 提示用户输入保存路径并确认
while true; do
    read -p "请输入要保存文件的本地路径: " SAVE_PATH
    read -p "你输入的保存路径是 $SAVE_PATH，确认继续执行吗？(y/n): " CONFIRM
    case $CONFIRM in
        [Yy])
            # 检查保存路径是否存在，如果不存在则尝试创建
            if [ ! -d "$SAVE_PATH" ]; then
                mkdir -p "$SAVE_PATH"
                if [ $? -ne 0 ]; then
                    echo "无法创建保存目录 $SAVE_PATH" >&2
                    exit 1
                fi
            fi
            break
            ;;
        [Nn])
            echo "请重新输入保存路径。"
            ;;
        *)
            echo "无效的输入，请输入 y 或 n。"
            ;;
    esac
done

# 执行下载操作
# 修正下载文件名显示错误
echo "正在下载 /Images.zip 到 $SAVE_PATH ..."
if ! "$TARGET_BINARY" download /Images.zip -saveto "$SAVE_PATH"; then
    echo "下载 /Images.zip 失败" >&2
    exit 1
fi

echo "文件 /Images.zip 下载成功，已保存到 $SAVE_PATH"

# 定义下载的文件路径
DOWNLOADED_FILE="$SAVE_PATH/Images.zip"

# 检查下载的文件是否存在
if [ ! -f "$DOWNLOADED_FILE" ]; then
    echo "未找到下载的文件 $DOWNLOADED_FILE，可能下载过程出现问题。"
    exit 1
fi

# 直接解压文件到当前保存路径
echo "正在解压 $DOWNLOADED_FILE 到 $SAVE_PATH ..."
# 由于是.zip 文件，使用 unzip 命令解压
if ! unzip "$DOWNLOADED_FILE" -d "$SAVE_PATH"; then
    echo "解压 $DOWNLOADED_FILE 失败" >&2
    exit 1
fi

echo "文件 $DOWNLOADED_FILE 解压成功，已解压到 $SAVE_PATH"

# 定义解压后路径
EXTRACT_DIR="$SAVE_PATH/Images/Images"

# 检查解压后路径是否存在
if [ ! -d "$EXTRACT_DIR" ]; then
    echo "解压后路径 $EXTRACT_DIR 不存在" >&2
    exit 1
fi

# 进入解压后路径
if ! cd "$EXTRACT_DIR"; then
    echo "无法进入解压后路径 $EXTRACT_DIR" >&2
    exit 1
fi

# 检查 images_load.sh 脚本是否存在
SCRIPT_PATH="$EXTRACT_DIR/images_load.sh"
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "未找到 $SCRIPT_PATH 脚本" >&2
    exit 1
fi

# 为脚本添加执行权限
if ! chmod +x "$SCRIPT_PATH"; then
    echo "为 $SCRIPT_PATH 添加执行权限失败" >&2
    exit 1
fi

# 运行 images_load.sh 脚本
echo "正在运行 $SCRIPT_PATH 脚本..."
if ! "$SCRIPT_PATH"; then
    echo "运行 $SCRIPT_PATH 脚本失败" >&2
    exit 1
fi

echo "脚本 $SCRIPT_PATH 运行成功"
