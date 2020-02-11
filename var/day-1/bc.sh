#!/bin/bash
read -p "num1: " num1
read -p "num2: " num2
# scale 设置精度，`` 命令行替换
# shellcheck disable=SC2006
num3=$(echo "scale=4;$num1*$num2" | bc)
echo "${num3}"
