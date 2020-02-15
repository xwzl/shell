#!/bin/bash
# 搜索 /etc 下的文件（非目录），文件名以 conf 结尾，且大于 10 k,然后将其删除
touch hello.txt
ls -al
# {} \; 是特定的格式
find . -name "*.txt" -exec rm -rf {} \;

rm -rf ./copy/*

# 找到当前目录下，小于 1k 文件，将其复制到 copy 目录下
find . -size -100c -exec cp {} ./copy/ \;

# 将 /var/log/ 目录下以 log 结尾的文件，且更改时间在 7 天以上的删除
find /var/log/ -name '*.log' -time '*.conf' -exec -rf {}  \;
# 将 /var/log/ 目录下以 log 结尾的文件，且更改时间在 7 天以上的复制到 /root/conf 目录下
find /var/log/ -name '*.log' -time '*.conf' -exec cp {} /root/conf/  \;

# -ok 和 exec 工程一样，只是每次操作都会给用户提示
# 逻辑运算符：
#  -a 与
#  -o 或
#  -not|! 非
# 查找当前目录下，属主不是 hdfc 的所有文件
find . -not -user hdfs | find . ! -user hdfs
