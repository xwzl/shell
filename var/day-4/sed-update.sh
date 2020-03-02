#!/bin/sh
. ./../common/print.lib

#  编辑命令	含义
#  1s/old/new/	替换第一行内容 old 为 new
#  1,10s/old/new/	替换 1 行到 10 行内容的 old 为 new
#  1,+5s/old/new/	替换 1 行到 6 行的内容 old 为 new
#  /pattern1/s/old/new/	替换匹配到 pattern1 的行内容 old 为 new
#  /pattern1/,/pattern2/s/old/new/	替换匹配到 pattern1 的行直到匹配到 pattern2 的所有行内容 old 为 new
#  /pattern1/,10s/old/new/	替换匹配到 pattern1 的行到 10 行的所有行内容 old 为 new
#  10,/patttern1/s/old/new/	替换第 10 行直到匹配到 pattern1 的所有行内容 old 为 new

file_name="$(pwd)/sed-update-data.txt"
# shellcheck disable=SC1072
if [ ! -f "${file_name}" ]; then
  echo "sed-data.txt is not exist! Create ${file_name}"
  # shellcheck disable=SC2129
  echo "I love python,but I also love java" >>"${file_name}"
  echo "I love PYTHON" >>"${file_name}"
  echo "/sbin/log:root,password" >>"${file_name}"
  echo "/sbin/log:roots,password" >>"${file_name}"
  echo "/sbin/log:admin,password" >>"${file_name}"
  echo "Hadoop is bigdata frame" >>"${file_name}"
  echo "H1212312 is bigdata frame" >>"${file_name}"
fi

delimiter
#sed -i "1s/love/LOVE/" "${file_name}"
# 替换所有的 love 为 LOVE
sed -i "1s/love/LOVE/g" "${file_name}"
cat "${file_name}"

delimiter
# 替换 1 到 4 行中的 /sbin/log 为 /bin/log
sed -i "1,4s/\/sbin\/log/\/bin\/log/g" "${file_name}"
cat "${file_name}"

delimiter
# 匹配到 /bin/log 的行，替换这一行中 log 为 LOG
sed -i "/\/bin\/log/s/log/LOG/g" "${file_name}"
cat "${file_name}"

delimiter
# 从匹配到以 /bin 开头的行，到其中包含 admin 的行，将这些内容中的 log 改为 test
sed -i "/^\/bin/,/admin/s/password/test/g" "${file_name}"
cat "${file_name}"


delimiter
# 从匹配到以 /bin 开头的行，到第3行修改数据,这个命令很容易出错
sed -i "/^I/,3s/bin/BIN/g" "${file_name}"
cat "${file_name}"

delimiter
# 从第2行开始，替换 I 为 i
sed -i "2,/^I/s/I/i/g" "${file_name}"
cat "${file_name}"

delimiter
# 删除数字
sed -i "s/[0-9]*//g" "${file_name}"
cat "${file_name}"

# 总结 s/pattern/new/g 是基本的替换模板，其中 s 前面可以加限定的行数或者正则表达式，指定替换范围
rm -rf "${file_name}"
