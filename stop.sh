#!/bin/bash
app_name=clash

processNum=`ps | grep ${app_name} | grep -v grep | wc -l`;
echo $processNum
if [ $processNum -eq 0 ];then
    echo 进程已停止 
else
    echo 目标存在，将执行杀死
    killall -9 ${app_name}
    sleep 3
    #内嵌
    abc=`ps | grep ${app_name} | grep -v grep | wc -l`;
    echo $abc
    if [ $abc -eq 0 ];then
        echo 进程已停止 
    else
        echo 目标存在，请手动尝试杀死
        sleep 2
        echo 脚本结束
    fi
     
fi


