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
# 脚本参数内容列表
echo "$@"

# 脚本进程 id
echo "$$"

# 上一次命令是否执行成功
echo "$?"

# 打印当前程序的名称
echo "$0"

# 过滤掉脚本本身进程 id
grep -v $0

# is_group_in_config 返回 0 或者 1, 0 执行 echo exist ，1 执行 echo not in exist
#is_group_in_config $1 && echo exist || echo not in exist

# 移除脚本输入时的第一个参数 -g demo => demo
#shift
