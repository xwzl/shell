#!/bin/bash
# 命令替换
function command_instead() {
  ss=$(pwd)
  s1s=$(pwd)
  echo "${s1s}"
  # 函数参数的个数
  echo "$#"
}

command_instead

# 脚本参数的个数
echo "$#"

# 脚本进程 id
echo "$$"

# 上一次命令是否执行成功
echo "$?"

# 过滤掉脚本本身进程 id
grep -v $0

