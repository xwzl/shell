#!/bin/bash
#  利用 sed 查询特定内容
FILE_NAME="$(pwd)/my.cnf"

#grep -E "^\[" "${FILE_NAME}"

#sed -n "/^\[.*\]/p" "${FILE_NAME}"

#  client
#  mysql
#  mysqld
#  mysqldump
#  mysql
#  myisamchk
#  mysqlhotcopy
function get_all_segments() {
  # shellcheck disable=SC2005
  echo "$(sed -n "/^\[.*\]/p" "${FILE_NAME}" | sed -e "s/^\[//g" -e "s/\]//g")"
}
function count_items_in_segment() {
  #  grep  -v ^# 排除 # 开头
  #  grep -v ^$ 排除 空格开头
  # shellcheck disable=SC2005
  echo "$(sed -n "/\[$1\]/,/\[.*\]/p" "${FILE_NAME}" | grep -v ^# | grep -v ^$ | grep -v "\[.*\]" | wc -l)"
}

number=0
for seg in $(get_all_segments); do
  item_count=$(count_items_in_segment "${seg}")
  # shellcheck disable=SC2003
  number=$(expr ${number} + 1)
  echo "${number}: ${seg} ${item_count}"
done
