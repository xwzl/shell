#!/bin/bash
#  sed 反向引用
. ./../common/print.lib

data_name="$(pwd)/sed-common-data.txt"

rm -rf "${data_name}"

# shellcheck disable=SC1072
if [ ! -f "${data_name}" ]; then
  # shellcheck disable=SC2129
  echo "hadAAp is bigdata frame" >>"${data_name}"
  echo "hadBBp is bigdata frame" >>"${data_name}"
  echo "hadBBp is bigdata frame" >>"${data_name}"
  echo "hadBBp is bigdata frame" >>"${data_name}"
fi

# backreference
delimiter
echo "反向引用:匹配 had 开头，且后面跟随任意两个字符，最后以 p 结尾大字符替换为 HADOOP"
sed -n "s/had..p/HADOOP/g;p" "${data_name}"

delimiter
echo "反向引用:匹配 had 开头，且后面跟随任意两个字符，最后以 p 结尾大字符,后面追加一个字符 s"
echo "sed 命令中，& 表示前面匹配到的内容"
sed -n "s/had..p/&s/g;p" "${data_name}"

echo "sed 命令中，\1 表示前面匹配到的内容，\1 使用时必须把 pattern 用 () 括起来"
sed -n "s/\(had..p\)/\1p/g;p" "${data_name}"

echo "sed 命令中 \1 与 & 都可以表示前面匹配到的内容，\1 使用时必须把 pattern 用 () 括起来"

delimiter
echo "\1 比 & 灵活地方是可以替换部分字符串,替换部分字符串时"
sed -n "s/\(had\)..p/\1oop/g;p" "${data_name}"

delimiter
x=had
y=qq
echo "sed 变量引用${x}"

sed -n "s/$x/$y/g" "${data_name}"
