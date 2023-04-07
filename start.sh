#!/bin/bash
ikun=`ps | grep clash-linux- | grep -v grep | wc -l`;
if [ $ikun -eq 1 ];then
	sleep 1
	echo 该进程已存在,退出脚本
	exit
else
# 赋权
chmod -R 777 /root/clash
chmod -R 755 /root/.bashrc
# 写入环境变量，如果你希望系统不进行代理请注释掉
echo 写入环境变量

# 定义要写入的字符
content="export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7891"

# 定义要写入的文件路径
file_path="/root/.bashrc"

# 判断文件中是否已经包含该字符
if grep -q "$content" "$file_path"; then
    	echo "已存在，退出"
else
    # 写入字符到文件中
	if tail -n 1 "$file_path" | grep -q "^$"; then
    		echo "已有空行"
	else
    		echo "" >> "$file_path"
    		echo "插入空行"
	fi
	sleep 1
   	echo "$content" >> "$file_path"
    	echo "写入成功"
fi

sleep 1
source /root/.bashrc
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
fi
