#!/bin/bash

cd /usr/local/bin/ \

wget https://github.com/qjfoidnh/BaiduPCS-Go/releases/download/v3.9.7/BaiduPCS-Go-v3.9.7-linux-amd64.zip \

unzip BaiduPCS-Go-v3.9.7-linux-amd64.zip \

cd /usr/local/bin/BaiduPCS-Go-v3.9.7-linux-amd64.zip/ \

mv BaiduPCS-Go /usr/local/bin/ \

chmod +x BaiduPCS-Go \

BaiduPCS-Go -v
