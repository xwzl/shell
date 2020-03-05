#!/bin/bash
# 在 /etc 找 .conf 结尾的文件
# find /etc -name '*.conf'
`ls -al | grep aa.txt &> /dev/null`


if [ $? -eq 1 ];then
  echo "Create test files as demo samples !"
  touch aa.txt AA.txt Aa.txt
fi

# 当前文件路径
current_path=`pwd`

# -name 参数默认区分大小写
find "${current_path}" -name 'A*.txt'

# 查找当前目录下文件名为 aa 的文件，不区分大小写 find . -iname A*.txt
echo "-iname not case sensitive"
find . -iname "A*.txt"

# 查找文件属主(用户 root )为 root 的所有文件
echo "Find files in the current directory as root"
find . -user "root"

# -group 查找文件属组为 yarn 的所有文件

# -type 如下
#  f 文件         find .type f
# 查找 root 目录下所有的普通文件
#find /root -maxdepth 2 -type f
find `pwd` -type f
find /opt -name "docker" -type d
#  d 目录         find .type d
#  c 字符设备文件  find .type c
#  b 块设备文件    find .type b
#  l 链接文件      find .type l
#  p 管道文件      find .type p

### -size
#  -n 大小大于 n 的文件
#  +n 大小小于 n 的文件
#  n  大于等于 n 的文件

# 查找 /ect 目录下小于 10000 字节的文件
find /etc -size -10000c
# 查找 /ect 目录下大于 1M 的文件
find /etc -size +1M
