#!/bin/bash

user="xuweizhi"
password="123456"
host="47.105.218.58"

mysql_conn="mysql -u"$user" -p"$password" -h"$host""

# 改变 while 中的默认分隔符
# IFS=":"
cat data.txt | while read id	name age birth sex
do
      # 变量双引号会报错
      $mysql_conn -e "insert into qq.user values('$id','$name','$age','$birth','$sex')"
done