#!/bin/sh
. ./../common/print.lib

data_name="$(pwd)/sed-pattern-data.txt"

# shellcheck disable=SC1072
if [ ! -f "${data_name}" ]; then
  # shellcheck disable=SC2129
  echo "I love python1" >>"${data_name}"
  echo "I love python2" >>"${data_name}"
  echo "I love python3" >>"${data_name}"
  echo "i love python4" >>"${data_name}"
  echo "I love python5" >>"${data_name}"
  echo "I love python6" >>"${data_name}"
  echo "I love python7" >>"${data_name}"
  echo "I love python8" >>"${data_name}"
  echo "I love python9" >>"${data_name}"
  echo "I love python10" >>"${data_name}"
  echo "I love python11" >>"${data_name}"
  echo "I love python12" >>"${data_name}"
  echo "I love python13" >>"${data_name}"
  echo "i love python14" >>"${data_name}"
  echo "I love python15" >>"${data_name}"
  echo "I love python16" >>"${data_name}"
  echo "I love python17" >>"${data_name}"
  echo "I love python18" >>"${data_name}"
  echo "I love python19" >>"${data_name}"
fi

# 删除第 1 行
#sed -i "1d" "${data_name}"

# 删除第 1 行
#sed -i "1,5d" "${data_name}"

# 删除第 1 到 11 行
#sed -i "1,+10d" "${data_name}"

# 删除 python15 到 python15 行
sed -i "/python15/,/python15/d" "${data_name}"

# 删除匹配 python15 的行
sed -i "/python15/d" "${data_name}"

# 删除以 yard 开头的行
sed -i "/^yard/d" "${data_name}"

# 删除以 /bin/log 开头的行
sed -i "/^\/bin\/^log/d" "${data_name}"

# 删除以 yard 开头的行,直到第 13 行被删除掉
sed -i "/^yard/,13 d" "${data_name}"

# 删除第 5 行到以 ftp 开头的所有内容
sed -i "5,/^frp/d" "${data_name}"

# 删除以 yard 开头的行到最后行的所有内容
sed -i "/^yard/,/$/d" "${data_name}"

# 删除以 # 或者空格开头的行
sed -i "/^#/d;/^$/d" "${data_name}"

# 删除 空格 + # 开头的行，也就是传说中的是注释行
sed -i "/\[:blank:\]*#/d;/^$/d" "${data_name}"
sed -i "/\[:blank:\]*#/d;/^$/d" "${data_name}"

# 在配置文件中所有以 # 开头的行前面添加 * 符号，注意以 # 开头的行不添加
sed -i "s/^[^#]/\*&/g" "${data_name}"
#delimiter
#echo "删除源文件"
#rm -rf "$data_name"
