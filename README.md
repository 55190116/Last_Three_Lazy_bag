# 三人行懒人包 （Last\_Three\_Lazy\_bag）

## 一、前言

### 1、概述

本懒人包只是为了方便 **小白** 和 **重装系统** 的用户提供帮助，**大佬** 勿喷！后续会慢慢加入 **实用** 的 **Compose** 进入懒人包。懒人包支持 **一键安装，单独安装、一键删除，目录更改等…** ，具体可以看以下的解析！

### 2、支持系统

1.0 版本：已经适配 **飞牛** 了！如需 **其他平台** 请将尝试使用 **修改配置目录服务** 来实现懒人包安装！

2.0 版本：已经适配 ​**飞牛**​、​**群晖**​、**绿联（新/旧）** 了！只需选择系统并更改根目录为自身目录即可，实现懒人包安装！

2.0 版本后：不在对外进行公布脚本内容！

## 二、如何单独创建想用的容器

```
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

| 序号 | 懒人包是否包含 | 容器名称 | 容器端口 | 初始账号 | 初始密码 | 功能 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | 否 | nastools | 3000 | admin | password | 影视看板 |
| 2 | 是 | moviepilot | 3000 | admin | 运行日志中 | 影视看板 |
| 3 | 是 | jellyfin | 3010 | 自定义 | 自定义 | 媒体服务器 |
| 4 | 是 | qbaittorrent | 3020 | admin | 运行日志中 | 下载器 |
| 5 | 是 | transmission | 3030 | root | root | 下载器 |
| 6 | 是 | iyuuplus | 3040 | 自定义 | 自定义 | 辅种 / 转种 |
| 7 | 是 | xunlei | 3050 | admin | admin | 下载器 |
| 8 | 是 | jackett | 3060 | / | / | 索引器 |
| 9 | 是 | alist-tvbox | 3070 | admin | admin | IPTV |
|  | 是 | alist-tvbox | 3080 | / | / | 内置面板 |
| 10 | 是 | apipan | 3090 | / | / | 网盘索引器 |
| 11 | 是 | vertex | 3095 | admin | data 目录下查看 | PT 刷流 |
| 12 | 是 | navidrome | 4000 | 自定义 | 自定义 | 音乐服务器 |
| 13 | 是 | music-tag-web | 4010 | admin | admin | 音乐刮削 |
| 14 | 是 | reader | 5000 | 自定义 | 自定义 | 电子书服务器 |
| 15 | 是 | komga | 6000 | 自定义 | 自定义 | 动漫服务器 |
| 16 | 否 | wps-office | 7000 | admin | admin | WPS网页版 |
| 17 | 是 | verysync | 7010 | 自定义 | 自定义 | 微力同步 |
| 18 | 是 | pdftool | 7020 | / | / | PDF工具箱 |
| 19 | 是 | kkfileview | 7030 | / | / | 在线预览文件 |
| 20 | 是 | siyuan | 7040 | / | / | 笔记 |
| 21 | 是 | alist | 7050 | admin | 运行日志中 | 网盘挂载 |
| 22 | 是 | newsnow | 7060 | / | / | 最新实事 |
| 23 | 是 | npc | / | / | / | 内网穿透 |
| 24 | 否 | frpc | / | / | / | 内网穿透 |
| 25 | 否 | v2raya | 8010 | 自定义 | 自定义 | 梯子 |
| 26 | 是 | sun-panel | 9000 | admin@sun.cc | 12345678 | 美化面板 |
| 27 | 是 | emulatorjs | 10000 | / | / | 掌机模拟器 |
|  | 是 | emulatorjs | 10001 | / | / | 容器后台 |
| 29 | 否 | teamspeak | 10010 | / | / | 语音服务 |
|  | 否 | teamspeak | 10011 | / | / | 文件传输 |
|  | 否 | teamspeak | 10012 | / | / | DNS域名解析 |
|  | 否 | teamspeak | 10013 | / | / | 服务器查询 raw |
| 30 | 是 | qinglong | 11000 | 自定义 | 自定义 | 脚本面板 |
| 31 | 是 | home-assistant | 11010 | 自定义 | 自定义 | 自动化家具 |
| 32 | 否 | mysql | / | / | / | 数据库 |

## 四、懒人包目录配置信息

| 序号 | 文件夹名称 | 作用 |
| :--- | :--- | :--- |
| 1 | Compose | 用于存放懒人包配置文件的文件夹 |
| 2 | Docker | 用于存放容器的文件夹 |
| 3 | Downloads | 用于迅雷远程下载文件夹 |
| 4 | Music | 用于存放音乐的 |
| 5 | Synchronous | 用于同步文件夹的 |
| 6 | Video | 用于存放影视的文件夹，包含硬链接文件夹 |
| 7 | 媒体元 | 用于存放飞牛影视的元数据文件夹 |

## 五、如何使用懒人包

* 打开 **FinalShell** 软件
* 进入 **root** 权限，输入 `sudo -i` 并输入飞牛 **密码**，进入 root 权限
* 输入 `cd /vol1/1000/` 进入用户文件夹根目录，`mkdir Compose` 创建 Compose 文件夹
* 输入 `cd Compose` 进入 Compose 文件夹，并输入如下命令

```
wget -O Last_Three_Lazy_bag.sh.enc https://gh.llkk.cc/https://raw.githubusercontent.com/ATaKi-Myt/Last_Three_Lazy_bag/refs/heads/main/Last_Three_Lazy_bag.sh.enc
```

* 拉取完成对脚本进行解密，解密密码联系作者

```
openssl enc -d -aes-256-cbc -salt -pbkdf2 -iter 100000 -in Last_Three_Lazy_bag.sh.enc -out Last_Three_Lazy_bag.sh
```

* 解密完成后，输入 `bash Last_Three_Lazy_bag.sh` 运行脚本
* 按照提示输入数字即可完成懒人包的安装

## 六、如何使用 Sun-Panel 美化配置

* 打开 Sun-Panel 的 Web 界面
* 点击右上角，进入配置界面
* 选择导入导出选项
* 导入 Sun-Panle 美化及图标文件夹内的 .json 文件即可
* 如果发生图标缺失，请下载 Sun-Panel-Icon.zip 导入图片即可

## 七、更新日志

### v1.0

版本懒人包含、影视、音乐、小说 、漫画、办公、网络、 美化 、娱乐、系统等九大服务，支持一键安装，单独安装、一键删除，目录更改等…

### v1.0.1

版本新增，青龙面板、思源笔记、Alist等…

### v1.0.2

版本加入了 Sun-Panel 的美化及图标文件，直接导入配置即可进行美化操作！使你的 Nas 界面更加美观！（适配飞牛自带应用）

### v1.0.3

v1.0.3 版本更新日志：

1、更新了 Plugins / Script / Sun Panel Json 文件夹及文件

2、更新了 Script 内的 [CreateDir.sh](http://CreateDir.sh) 文件内容

3、更新了新的容器 home-assistant 智能家居集成

4、更新了 Last\_Three\_Lazy\_bag.sh 执行顺序提示

5、更新了细节性的 Bug 内容

### v1.0.4

v1.0.4 版本更新日志：

1、更新了 Compose 文件夹 Compose1 / 6 文件内容

2、更新了 Script 内的 [CreateDir.sh](http://CreateDir.sh) 文件内容

待开发：

1、绿联、黑裙、威联通等Nas懒人包

### v1.0.5

v1.0.5 版本更新日志：

1、更新了 Compose 文件夹全部文件内容，因不在需要 version: "3" 版本定义，取消全部版本协议

2、更新了新的容器，newsnow、npc、teamspeak、mysql 容器

3、更新了懒人包内所有文件是否包含在内的注释

4、修复了迅雷下载文件夹 BUG ，不在需要手动重启映射文件了

5、修复了 Synchronous 文件夹 BUG ，不在生成 synchronous 文件夹了

### v2.0

v2.0 版本更新日志：

一、系统支持

1、适配飞牛系统
2、适配群晖系统
3、适配绿联(新/旧)系统
4、待适配极空间系统

二、容器支持

1、以支持32个容器（默认安装26个容器）
2、包含、影视、音乐、小说 、漫画、办公、网络、 美化 、娱乐、系统等九大系统服务
3、支持一键安装、一键删除、一键更改目录
4、支持自定义安装

三、目录整合

1、对目录进行了充分的分配、包含配置文件目录、容器目录、下载目录、音乐目录、影视目录、办公同步目录等
2、对插件目录进行了提前创建，为后续 Web 配置进行了提前规划
3、对前期版本的文件 Bug 进行了修复

四、端口整合

1、对端口由系统进行划分
2、按系统分为 3000-4000、4000-5000、5000-6000、6000-7000、7000-8000、8000-9000、9000-10000、11000-12000

五、本地安装

1、支持本地上传安装服务
2、提供了本地上传镜像地址
3、大幅度解决了各系统拉取镜像失败的解决

六、面板美化

1、提供了 Sun Panel 的美化配置文件
2、提供了 Sun Panel 的美化图标包

### v2.0.1

v 2.0.1 更新日志

一、拉取脚本重大升级
1、更新全新 LOGO 、提供了项目地址 、 博客地址 、 作者微信等......
2、更新更改目录文件夹可以选择删除 .bak 文件选项
3、更新创建根目录文件夹为全部文件夹，修复所有创建文件夹 BUG
4、更新删除懒人包文件夹，之前为默认存储空间全部删除，现在为（删除全部镜像 / 容器 / 懒人包文件夹）
5、新增 2 项服务分别为：3号 / 14号服务，服务内容为（仅从网盘拉取镜像）（仅执行更新服务）
6、仅从网盘拉取镜像服务介绍：一键运行拉取安装全部懒人包镜像
7、仅执行更新服务介绍：【（全部容器停止并删除）（可进行容器选择，保留自身容器）】

二、Compose 配置文件更新
1、Compose 配置文件现在已更新至 35 个容器，默认精简版安装 22 个容器
2、优化拉取速度，目前软路由 / 毫秒镜像源拉取速度为 480 ms
3、以优化全系统 Nas 的配置文件（群晖的 nastool 目前暂时无法运行）其余以全部适配完毕

三、容器方面
1、更新了 4 个容器内容分别为：firefox 、 iptv-api 、 embyserver 、metatube
2、目前插件已经集成到 github 项目地址，直接将插件拉取即可
3、firefox  乱码问题需要导入字体即可
4、embyserver 拉取的是开心版，建议支持正版，尊重作者！！！
5、metatube 默认不安装，如需小姐姐刮削请自行添加 docker 容器

四、项目更新进度
1、继续优化懒人包版本更新，后期适配极空间、威联通等......
2、Compose Shop 项目已经建库，后续会为大家推送

五、拉取赞助
1、为了适配后续项目的 Nas 系统，还请大家多多支持赞助我们的博客，为大家提供美好且优质的脚本运行

## 八、作者信息

### 哔哩哔哩主页：***[最后三人行个人主页](https://space.bilibili.com/3546844344879871?spm_id_from=333.1007.0.0)***

### 作者博客：***[三人行博客](https://blog.010322.xyz/)***

### 作者绿泡泡：***M13051661743***
