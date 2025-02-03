# 三人行懒人包 （Last_Three_Lazy_bag）
## 一、前言
### 1、概述
本懒人包只是为了方便 **小白** 和 **重装系统** 的用户提供帮助，**大佬** 勿喷！后续会慢慢加入 **实用** 的 **Compose** 进入懒人包。懒人包支持 **一键安装，单独安装、一键删除，目录更改等...** ，具体可以看以下的解析！
### 2、支持系统
目前自用飞牛Nas，已经 **适配飞牛** 了！如需 **其他平台** 请将尝试使用 **修改配置目录服务** 来实现懒人包安装！
## 二、如何单独启动容器
``` yaml
# 单独启动容器
version: "3"
services: # 定义服务
  wps-office: # 服务名称
   image: linuxserver/wps-office:chinese # 镜像名称（可更改冒号后版本）
   container_name: wps-office # 容器名称（可更改）
   ports: # 容器端口（可更改冒号前端口）
     - 3030:3000
     - 3031:3001
   volumes: # 冒号前替换成自身路径即可（可更改）
     - /vol1/1000/Docker/wps-office/config:/config
     - /vol1/1000/Docker/wps-office/Desktop:/config/Desktop
     - /vol1/1000/Docker/wps-office/Fonts:/usr/share/fonts/wps-fonts
   environment: # 环境变量
     - PUID=0
     - PGID=0
     - TZ=Asia/Shanghai
     - CUSTOM_USER=admin
     - PASSWORD=admin
   restart: always # 总是启动容器
   network_mode: bridge # 网络桥接
```
## 三、懒人包包含容器详细信息
|序号|容器名称|容器端口|初始账号|初始密码|
|-|-|-|-|-|
|1|nastools|3000|admin|password|
|2|jellyfin|3010|自定义|自定义|
|3|qbaittorrent|3020|admin|运行日志中|
|4|transmission|3030|root|root|
|5|iyuuplus|3040|自定义|自定义|
|6|xunlei|3050|admin|admin|
|7|jackett|3060|/|/|
|8|alist-tvbox|3070|admin |admin |
||alist-tvbox|3080|/|/|
|9|apipan|3090|/|/|
|10|navidrome|4000|自定义|自定义|
|11|music-tag-web|4010|admin|admin|
|12|reader|5000|自定义|自定义|
|13|komga|6000|自定义|自定义|
|14|wps-office|7000|admin|admin|
|15|verysync|7010|自定义|自定义|
|16|pdftool|7020|/|/|
|17|kkfileview|7030|/|/|
|18|frpc|/|/|/|
|19|v2raya|8010|自定义|自定义|
|20|sun-panel|9000|admin@sun.cc|12345678|
|21|emulatorjs|10000|/|/|
||emulatorjs|10001|/|/|
|22|qinglong|11000|admin|admin|
## 四、懒人包目录配置信息
|序号|文件夹名称|作用|
|-|-|-|
|1|Compose|用于存放懒人包配置文件的|
|2|Video|用于存放影视的，需要执行创建其余文件夹服务生成后续文件夹|
|3|Music|用于存放音乐的|
|4|Docker|用于存放容器的|
|5|frpc|用于存放内网穿透的配置文件.ini|
|6|synchronous|用于同步文件夹的|
## 五、如何使用懒人包
- 打开 **FinalShell** 软件
- 进入 **root** 权限，输入 `sudo -i` 并输入飞牛 **密码**，进入 root 权限
- 输入 `cd /vol1/1000/` 进入用户文件夹根目录，`mkdir Compose` 创建 Compose 文件夹
- 输入 `cd Compose` 进入 Compose 文件夹，并输入如下命令
``` bash
wget -O Last_Three_Lazy_bag.sh --no-check-certificate https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Last_Three_Lazy_bag.sh
```
- 下载完成后，输入 `bash Last_Three_Lazy_bag.sh` 运行脚本
- 按照提示输入数字即可完成懒人包的安装
## 六、作者信息
### 哔哩哔哩主页：[最后三人行个人主页](https://space.bilibili.com/3546844344879871?spm_id_from=333.1007.0.0)
