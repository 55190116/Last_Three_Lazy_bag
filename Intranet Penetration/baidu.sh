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
