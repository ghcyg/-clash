#!/bin/bash
# 获取系统架构
arch=$(uname -m)
if [ "$arch" = "x86_64" ]; then
	
	# 自定义函数
	Num=`ps | grep clash-linux-amd64 | grep -v grep | wc -l`;
	if [ $Num -eq 0 ];then
    		echo 进程已停止 
    		exit
	else
    		echo 目标存在，将执行杀死
		killall -9 clash-linux-amd64
		sleep 1
		echo 删除环境变量
		sed -i '/127/d' /root/.bashrc
		source /root/.bashrc
	fi
elif [[ "$arch" =~ "aarch64" ||  "$arch" =~ "arm64" ]]; then
	
	abc=`ps | grep clash-linux-arm64 | grep -v grep | wc -l`;
	if [ $abc -eq 0 ];then
    		echo 进程已停止
    		exit 
	else
    		echo 目标存在，将执行杀死
		killall -9 clash-linux-arm64
		sleep 1
		echo 删除环境变量
		sed -i '/127/d' /root/.bashrc
		source /root/.bashrc 
	fi
elif [ "$arch" = "armv7" ]; then
      
	
	qaz=`ps | grep clash-linux-armv7 | grep -v grep | wc -l`;
	if [ $qaz -eq 0 ];then
    		echo 进程已停止 
    		exit
	else
    		echo 目标存在，将执行杀死
    		killall -9 clash-linux-armv7
    		sleep 1
		echo 删除环境变量
		sed -i '/127/d' /root/.bashrc
		source /root/.bashrc
    	fi
else
    echo "不支持该系统，请手动停止"
    exit
    
fi
sleep 2
echo 做最后检查
ikun=`ps | grep clash-linux-$arch | grep -v grep | wc -l`;
if [ $ikun -eq 0 ];then
	sleep 1
	echo 已停止，退出    
else
	echo 失败，请手动尝试
fi
