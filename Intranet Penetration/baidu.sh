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

# 提示用户输入分享链接和提取码
read -p "请输入百度网盘分享链接: " SHARE_LINK
read -p "请输入分享链接的提取码（如果没有则直接回车）: " EXTRACT_CODE

# 检查用户是否输入了分享链接
if [ -z "$SHARE_LINK" ]; then
    echo "未输入有效的分享链接，下载取消。" >&2
    exit 1
fi

# 提示用户输入下载目录
read -p "请输入要下载到的本地目录: " LOCAL_DOWNLOAD_DIR

# 检查下载目录是否存在，如果不存在则尝试创建
if [ ! -d "$LOCAL_DOWNLOAD_DIR" ]; then
    mkdir -p "$LOCAL_DOWNLOAD_DIR"
    if [ $? -ne 0 ]; then
        echo "无法创建下载目录 $LOCAL_DOWNLOAD_DIR" >&2
        exit 1
    fi
fi

# 处理提取码参数
if [ -z "$EXTRACT_CODE" ]; then
    EXTRACT_CODE_PARAM=""
else
    EXTRACT_CODE_PARAM="-code=$EXTRACT_CODE"
fi

# 下载分享链接的文件
echo "正在下载分享链接的文件到 $LOCAL_DOWNLOAD_DIR ..."
if ! "$TARGET_BINARY" download -path="$LOCAL_DOWNLOAD_DIR" $EXTRACT_CODE_PARAM "$SHARE_LINK"; then
    echo "下载分享链接的文件失败。" >&2
    exit 1
fi

echo "分享链接的文件下载成功，已保存到 $LOCAL_DOWNLOAD_DIR。"
