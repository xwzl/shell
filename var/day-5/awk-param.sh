#!/bin/bash
num1="qq"
var1="xx"
# -v 外部变量引入 awk 文件中
awk -v num2="$num1" -v var2="$var1"  'BEGIN{print num2,var2}'

awk -f "$(pwd)/awk/do-awk.awk"

# 利用 -F 指定版本号
#awk -F ":"
