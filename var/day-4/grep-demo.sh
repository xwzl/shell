#!/bin/bash
# 第一种形式：
# grep [option] [pattern] [file1,file2]

# 判断当前路径的下的 data.txt 存不存在
if [ ! -f "$(pwd)/data.txt" ]; then
  echo "$(pwd)/data.txt 文件不存在"
  # shellcheck disable=SC2129
  echo "Hello world! Shell is a good language!" >>data.txt
  echo "hello world!" >>data.txt
  echo "test text!" >>data.txt
  echo "lol!" >>data.txt
  echo "p2p world!" >>data.txt
fi

# 第二种形式:对标准输出过滤
# command | grep [option] [pattern]
grep -i "hello" ./data.txt
# 支持扩展表达式，不加 -E 没有匹配项
grep -E "hello|Hello" ./data.txt
echo "-F 排除正则表达式的功能，按输入的匹配规则精确匹配"
grep -F "he*" ./data.txt
echo "正常情况"
grep "he*" ./data.txt

# 递归搜索所有文件中匹配 hello 单词的文件
#grep -r "hello"

# shellcheck disable=SC2002
cat ./data.txt | grep -i -n "hello"
cat ./data.txt | grep -w -s "hello"
