#!/bin/bash
# 获取系统所有用户输出
index=1

# shellcheck disable=SC2002
# shellcheck disable=SC2013
for user in $(cat ./../../data/password | cut -d ":" -f 1); do
  echo "This is ${index} user name: ${user}"
  # shellcheck disable=SC2004
  index=$((${index} + 1))
done

# 根据系统时间计算今年或者明年
echo "This is $(date +%Y) year!"z
echo "This is $(($(date +%Y) + 1)) year"

# 根据系统时间获取今年还剩多少星期，已经过了多少星期
# +%j 中间没有空格
day_of_year=$(date +%j)
echo "This year have passed ${day_of_year} days"

# shellcheck disable=SC2004
echo "Therer is $((365 - ${day_of_year})) days before new year"

# shellcheck disable=SC2004
echo "Today year have passed $((${day_of_year} / 7)) weeks"

# shellcheck disable=SC2004
echo "Today is $((365 / 7 - ${day_of_year} / 7)) week of this year"

# 判断 nginx 进程是否存在，不存在则打印
# ps -ef | grep nginx | grep -v grep : grep 查找 nginx 本身对应一个进程，因此需要过滤掉
# ps -ef | grep nginx | grep -v grep | wc -l： 统计有几行结果
# shellcheck disable=SC2126
# shellcheck disable=SC2009
nginx_process_num=$(ps -ef | grep nginx | grep -v grep | wc -l)
# echo "${nginx_process_num}"

# -eq 是等于的意思
if [ "${nginx_process_num}" -eq 0 ]; then
  git --version
fi
