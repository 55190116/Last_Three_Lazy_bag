一、单独启动容器

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

二、懒人包容器初始账号密码

nastools       用户名：admin 密码：password
moviepilot     用户名：admin 密码：运行日志中
jellyfin       用户名：自定义 密码：自定义
qbaittorrent   用户名：admin 密码：运行日志中
transmission   用户名：root  密码：root
iyuuplus       用户名：自定义 密码：自定义
xunlei         用户名：admin 密码：admin
jackett        用户名：无    密码：无
alist-tvbox    用户名：admin 密码：admin
apipan         用户名：无    密码：无
navidrome      用户名：自定义 密码：自定义
music-tag      用户名：admin 密码：admin
reader         用户名：自定义 密码：自定义
komga          用户名：自定义 密码：自定义
wps-office     用户名：admin 密码：admin
verysync       用户名：自定义 密码：自定义
pdftool        用户名：无    密码：无
kkfileview     用户名：无    密码：无
frpc           用户名：无    密码：无
v2raya         用户名：自定义 密码：自定义
sun-panel      用户名：admin@sun.cc 密码：12345678
emulatorjs     用户名：无    密码：无

三、懒人包目录配置及作用

Compose文件夹：用于存放懒人包配置文件的
Video文件夹：用于存放影视的，sh脚本生成后续文件夹
Music文件夹：用于存放音乐的
Docker文件夹：用于存放容器的
frpc文件夹：用于存放内网穿透的
synchronous：用于同步文件夹

四、懒人包端口配置

影视 3000 - 3090
音乐 4000 - 4010
小说 5000 - 5000
漫画 6010 - 6010
办公 7000 - 7030
网络 8010 - 8010
美化 9000 - 9000
娱乐 10000 - 10001

五、如何初始化镜像和容器

docker stop $(docker ps -aq) 停止所有容器
docker rm $(docker ps -aq) 删除所有容器
docker rmi $(docker images -a -q) 删除所有镜像

六、懒人包如何使用

如何使用懒人包
1、wget -O Last_Three_Lazy_bag.sh --no-check-certificate https://github.com/ATaKi-Myt/gitdemo/blob/main/Last_Three_Lazy_bag.sh
2、bash Last_Three_Lazy_bag.sh
3、选择安装服务即可

七、懒人包
本懒人包只提供了安装服务，具体的 Web配置需要自行进行配置！！！
