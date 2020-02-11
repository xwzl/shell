#!/bin/sh
# 如何判断一个数是否为整数？ expr 由于不能计算浮点数，因此紧接着 expr 后面进行 echo 操作，会打印 epxr 结果值？
# 如果为 0 说明运算成功，说明它是一个整数
#num1=10.1
#expr ${num1} + 1
#echo $?
#
#num1=1
#expr ${num1} + 1
#echo $?
while true; do
  read -p "please input a positive number: " num
  # 使 expr 结果不输出到桌面
  expr "${num}" + 1 >> /dev/null
  # $? = 0 说明 num 是一个整数
  # shellcheck disable=SC2181
  if [ $? -eq 0 ]; then
    # ${num} \> 0 ：大于 0 返回 1
    # 检查是否为一个正整数
    if [ $(expr "$num" \> 0) -eq 1 ]; then
      sum=0
      # shellcheck disable=SC2004
      for ((i = 0; i <= $num; i++)); do
        # shellcheck disable=SC2003
        sum=$(expr "${sum}" + ${i})
      done
      echo "1+2+3+......+$num = $sum"
    fi
  fi
  echo "error,input enlegal"
  continue
done
