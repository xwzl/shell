#!/bin/sh
. ./../common/print.lib

# shellcheck disable=SC1072
if [ ! -f "$(pwd)/sed-data.txt" ]; then
  echo "sed-data.txt is not exist! Create $(pwd)/sed-data.txt"
  # shellcheck disable=SC2129
  echo "I love python" >>"$(pwd)/sed-data.txt"
  echo "I love PYTHON" >>"$(pwd)/sed-data.txt"
  echo "Hadoop is bigdata frame" >>"$(pwd)/sed-data.txt"
fi

#  选项 | 含义
#  ---|---
#  -n | 指定模式匹配行
#  -e | 直接在命令行进行 seb 编辑，默认选项
#  -f | 编辑动作保存在文件，指定文件执行
#  -r | 支持扩展正则表达式
#  -i | 直接修改文件内容

delimiter_prefix

# p 命令为文本每一行打印输出，每一行打印了两次,因为 sed 默认会打印一次
sed 'p' "$(pwd)/sed-data.txt"


# sed -n 取消默认打印
delimiter_prefix
echo "sed -n 取消默认打印，只打印一次"
sed -n 'p' "$(pwd)/sed-data.txt"

#
delimiter_prefix
echo "/字符串/p:固定写法，匹配每一行中带有 python 的属性，如果有则打印"
sed -n '/python/p' "$(pwd)/sed-data.txt"

# -e 参数组合命令
delimiter
echo "组合命令"
sed -n -e '/python/p' -e '/PYTHON/p' "$(pwd)/sed-data.txt"

# 当命令行过于复杂，写入 sed-demo.sed 文件，使用 -f 参数进行命令替换
delimiter
echo "当命令行过于复杂，写入 sed-demo.sed 文件，使用 -f 参数进行命令替换"
sed -n -f "$(pwd)/sed-demo.sed" "$(pwd)/sed-data.txt"

# -r 支持扩展正则表达式
delimiter
echo "-r 支持扩展正则表达式"
sed -n  -r '/python|PYTHON/p' "$(pwd)/sed-data.txt"

# -i 直接修改文件内容
#delimiter
#echo "-i 直接修改文件内容"
#echo "s/旧字符串/新字符串/g:固定写法"
#sed -n 's/love/like/g;p' "$(pwd)/sed-data.txt"

# -i 直接修改文件内容
delimiter
echo "-i 直接修改文件内容"
echo "s/旧字符串/新字符串/g:固定写法"
sed -n -i 's/love/like/g;p' "$(pwd)/sed-data.txt"
