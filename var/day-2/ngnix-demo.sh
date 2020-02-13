#!/bin/bash
# 打印脚本运行中产生子进程 id
#echo "$$"
#this_pid=$$

# grep -v grep ：排除 grep nginx 的进程 id ,排除此脚本子进程的id
#ps -ef | grep nginx | grep -v grep | grep -v $this_pid

# 判断上诉指令是否执行成功：0 成功，1 失败
#echo "$?"

# shellcheck disable=SC2006
# shellcheck disable=SC2009

function nginx_monitor() {
  this_pid=$$
  #status=$(ps -ef | grep nginx | grep -v grep | grep -v $this_pid)
  # shellcheck disable=SC2091
  $(ps -ef | grep nginx | grep -v grep | grep -v $this_pid &>/dev/null)

  # shellcheck disable=SC2181
  if [ $? -eq 0 ]; then
    echo "Nginx is running well"
    # 睡眠三秒
    sleep 3
  else
    # 阻止 nginx
    docker restart nginx &>/dev/null
    #    docker restart nginx
    if [ $? -eq 1 ]; then
      echo "Nginx docker container not exist!"
      docker run --name nginx -d -p 8080:80 nginx &>/dev/null
      if [ $? -eq 1 ]; then
        docker pull nginx
      fi
      echo "Ngix docker container created successful!"
    fi
    echo "Nginx is down,Start it ...."
  fi
}

while true; do
  # nginx 进程监控，停止则重启
  nginx_monitor
done
