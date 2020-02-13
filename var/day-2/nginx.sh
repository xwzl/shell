#!/bin/sh
# 脚本子进程
this_pid=$$

function is_nginx_running() {
  ps -ef | grep nginx | grep -v grep | grep -v this_pid &>/dev/null

  # $? 判断上一次命令是否执行成功
  if [ $? -eq 0 ]; then
    # return 不写任何值，默认返回 0
    return
  else
    return 1
  fi
}

# is_nginx_running 返回 0 或者 1 ，三元表达式？
is_nginx_running && echo "Nginx is running" || echo "Nginx is stoped"
