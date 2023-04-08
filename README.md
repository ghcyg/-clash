# clash


clash使用教程
订阅链接转换 https://acl4ssr-sub.github.io/

使用之前确保linux含有git

第一步 git clone https://github.com/ghcyg/clash.git

第二步 替换bin目录下的配置文件

分为两种运行模式

1、更新模式，此运行方式需要将订阅链接填入env.sh中，然后运行 sh anew.sh

默认每次启动都会更新订阅源

2、使用自定义配置，需要将自己提供的配置文件放入bin文件夹Customization.yaml下，运行sh start.sh

该模式不会更新你的配置文件，适合稳定的线路

停止都是使用 sh stop.sh 这个命令
