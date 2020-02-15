#!/bin/bash
# -mtime
#-n n天内修改的文件
#+n n天以外修改的文件
# n  等于 n 天修改的文件
# 查找 /etc 目录下 5 天内之内修改且以 conf 结尾的文件
find /etc -mtime -5 -name "*.conf"
# 查找 /etc 目录下 10 天之前修改且属主为 root 的文件
find /etc -mtime +5 -user "root"

# -mmin
# -n n 分钟以内修改的文件
# +n n 分钟以外修改的文件
# 查找 /etc 目录下 30 分钟内修改的文件
find /etc -mmin -30
# 查找 /etc 目录下 30 分钟内修改的目录
find /etc -mmin +30 -type d

# - mindepth n 表示从 n 级子目录开始搜索
# 在 /etc 下的 3 级子目录开始搜索
find /etc -mindepth 3
# - maxdepth n 表示最多搜索到 n-1 级子目录
find /etc -maxdepth 2 -type f -size -10k -name "*.conf"
