#!/bin/bash
#  参数	含义
#  -r	将变量设为只读
#  -i	将变量设为整数
#  -a	将变量设为数组
#  -f	显示此脚本前面定义过的所有函数及内容
#  -F	仅显示此脚本前面定义的函数名
#  -x	将变量声明为环境变量

# 变量默认属性可读
var1="hello world"
var1="hello declare"
echo "${var1}"

# var1 变量设为只读
declare -r var1
var1="1111"
echo "${var1}"

# 取消变量
declare +r

num1=10
num2=${num1}+10
echo "${num2}"

# shellcheck disable=SC2003
expr ${num1} + 10

# num1 虽然没有处理，但是依然被处理 num3 处理为整型
declare -i num3
num3=${num1}+10
echo "${num3}"

function hello() {
  echo "hello"
}

#declare -f
#
#declare -F
# 数组
declare -a array
# 数组以空格作为间隔
array=("jack" "xu" "wei" "zhi")

# 查看所有数组元素 @
# shellcheck disable=SC2145
echo "array 数组所有数组元素：${array[@]}"
echo "array 数组元素个数：${#array[@]}"

echo "array 指定下标值：${array[0]}"
echo "array 指定小标值长度：${#array[0]}"

array[0]="hello"
echo "${array[0]}"

# shellcheck disable=SC2184
unset array[0]                # 删除元素
echo "${array[@]:1:2}"        # 分片访问
echo "${array[@]/xu/xuwezhi}" # 替换值

# 遍历
for i in "${array[@]}"; do
  echo "${i}"
done

unset array # [删除正个数组]

# 声明环境变量，外部也可引用
# declare -x array
