#!/bin/bash
function get_users() {
  users=$(cat ./../../data/password | cut -d ":" -f 1)
  # 返回函数值，返回了则不打印
  echo "$users"
}

get_users

# 命令替换获取函数返回值
user_list=$(get_users)
index=1
for user in $user_list; do
  echo "This is $index user:$user"
  index=$(($index + 1))
done
