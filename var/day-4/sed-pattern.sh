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
  echo "test love python6" >>"${data_name}"
  echo "q love python7" >>"${data_name}"
  echo "i love python8" >>"${data_name}"
  echo "I love python9" >>"${data_name}"
  echo "five love python10" >>"${data_name}"
  echo "I love python11" >>"${data_name}"
  echo "i love python12" >>"${data_name}"
  echo "I love python13" >>"${data_name}"
  echo "I love python14" >>"${data_name}"
  echo "q love python15" >>"${data_name}"
  echo "i love python16" >>"${data_name}"
  echo "q love python17" >>"${data_name}"
  echo "I love python18" >>"${data_name}"
  echo "I love python19" >>"${data_name}"
  echo "I love python20" >>"${data_name}"
  echo "I love python21" >>"${data_name}"
fi

# 直接指定行号
delimiter
sed -n '10p' "${data_name}"

# 直接指定行号,从10开始到13结束
delimiter
sed -n '10,13p' "${data_name}"

# 直接指定行号,从10开始到12结束
delimiter
sed -n '10,+2p' "${data_name}"

# 匹配是以 i 开头的行
delimiter
echo "匹配是以 i 开头的行"
sed -n '/^i/p' "${data_name}"

# 匹配是以 test 开头,five结尾的行
delimiter
echo "匹配是以 test开头,five结尾的行"
sed -n '/^test/,/^five/p' "${data_name}"

# 匹配是第 4 行开始,five结尾的行
delimiter
echo "匹配是第 4 行开始,five结尾的行"
sed -n '4,/^five/p' "${data_name}"

# 匹配是 five 开始,15 行之前的文本
delimiter
echo "匹配是 five 开始,15 行之前的文本"
sed -n '/^five/,15p' "${data_name}"

