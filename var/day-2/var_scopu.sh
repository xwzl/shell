#!/bin/sh

var1="hello world"

function foo() {
  var1="hello world!函数内部改变变量的值，外部也会影响"
  echo "$var1"
  var2="函数内容定义的变量，外部也可以引用"
  local var3="本地变量，外部不能引用？结果是不能引用"
}

echo $var1
echo $var2
echo $var3
echo "====================="
foo
echo $var1
echo $var2
echo $var3
