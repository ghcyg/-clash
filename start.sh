#!/bin/bash
# 赋权
 chmod -R 777 /root/clash
# 写入环境变量，如果你希望系统不进行代理请注释掉
cat > /etc/profile <<EOF
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7891
EOF
sleep 1
# 获取系统架构
arch=$(uname -m)
sleep 2
if [ "$arch" = "x86_64" ]; then
    echo 正在启动64位clash
    cd /root/clash/bin && nohup ./clash-linux-amd64 -f config.yaml > /root/clash/log.txt 2>&1 &
elif [[ "$arch" =~ "aarch64" ||  "$arch" =~ "arm64" ]]; then
    echo 正在启动32位程序
    cd /root/clash/bin && nohup ./clash-linux-arm64 -f config.yaml > /root/clash/log.txt 2>&1 &
elif [ "$arch" = "armv7" ]; then
    echo 正在启动32位程序
    # 在此处添加执行 32 位程序的命令    
    echo 正在启动32位程序
    cd /root/clash/bin && nohup ./clash-linux-armv7 -f config.yaml > /root/clash/log.txt 2>&1 &
else
    echo "退出"
    
fi
sleep 2
ikun=`ps | grep clash | grep -v grep | wc -l`;
if [ $ikun -eq 0 ];then
    echo 运行失败，再次尝试运行
    cd /root/clash/bin && nohup ./clash-linux-amd64 -f config.yaml > /root/clash/log.txt 2>&1 &
else
    echo 运行成功
fi
