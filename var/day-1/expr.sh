#!/bin/bash
num1=10
num2=200

# 浮点数只能进行运算，不能进行比较。除了加减乘除意外，最好使用 expr 表达式，因为$(()) 可能不是很正确。
# 管道符号需要转义，保留字
# shellcheck disable=SC2003
expr $num1 \| $num2
# shellcheck disable=SC2003
expr $num1 \& $num2
expr $num1 \< $num2
expr $num1 \< $num2
expr $num1 \<= $num2
expr $num1 \> $num2
expr $num1 \>= $num2
# shellcheck disable=SC2003
expr $num1 = $num2
# shellcheck disable=SC2003
expr $num1 != $num2
# shellcheck disable=SC2003
expr $num1 + $num2
# shellcheck disable=SC2003
expr $num1 - $num2
# shellcheck disable=SC2003
expr $num1 \* $num2
# shellcheck disable=SC2003
expr $num1 / $num2
# shellcheck disable=SC2003
expr $num1 % $num2
