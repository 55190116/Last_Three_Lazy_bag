#!/bin/bash

# 定义要下载的文件URL和下载目录
DOWNLOAD_URL="https://github.com/qjfoidnh/BaiduPCS-Go/releases/download/v3.9.7/BaiduPCS-Go-v3.9.7-linux-amd64.zip"
DOWNLOAD_DIR="/usr/local/bin"
ZIP_FILE="${DOWNLOAD_DIR}/BaiduPCS-Go-v3.9.7-linux-amd64.zip"
EXTRACT_DIR="${DOWNLOAD_DIR}/BaiduPCS-Go-v3.9.7-linux-amd64"

# 切换到下载目录
cd "$DOWNLOAD_DIR" || { echo "无法切换到目录 $DOWNLOAD_DIR"; exit 1; }

# 下载压缩包
wget "$DOWNLOAD_URL" || { echo "下载 $DOWNLOAD_URL 失败"; exit 1; }

# 解压压缩包
unzip "$ZIP_FILE" || { echo "解压 $ZIP_FILE 失败"; exit 1; }

# 切换到解压后的目录
cd "$EXTRACT_DIR" || { echo "无法切换到目录 $EXTRACT_DIR"; exit 1; }

# 移动可执行文件到目标目录
mv BaiduPCS-Go "$DOWNLOAD_DIR" || { echo "移动 BaiduPCS-Go 失败"; exit 1; }

# 清理临时文件
rm -f "$ZIP_FILE"

# 为可执行文件添加执行权限
chmod +x "${DOWNLOAD_DIR}/BaiduPCS-Go" || { echo "为 BaiduPCS-Go 添加执行权限失败"; exit 1; }

# 检查 BaiduPCS-Go 版本
"${DOWNLOAD_DIR}/BaiduPCS-Go" -v
