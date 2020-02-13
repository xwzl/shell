#!/bin/bash
#function foo() {
#  # 直接使用 $1 $2 $3 接收参数
#  echo "hello $1"
#  echo "hello $2"
#  echo "hello $3"
#}
#
## shellcheck disable=SC2162
#read -p "input:" source
#
#foo "$source" we text
function calcu() {
  case $2 in
  +)
    # shellcheck disable=SC2005
    # shellcheck disable=SC2003
    echo "$(expr "$1" + "$3")"
    ;;
  -)
    # shellcheck disable=SC2005
    # shellcheck disable=SC2003
    echo "$(expr "$1" - "$3")"
    ;;
  \*)
    # shellcheck disable=SC2005
    # shellcheck disable=SC2003
    echo "$(expr "$1" \* "$3")"
    ;;
  /)
    # shellcheck disable=SC2005
    # shellcheck disable=SC2003
    echo "$(expr "$1" / "$3")"
    ;;
  esac
}

# 脚本也可如函数那样调用参数
calcu "$1" "$2" "$3"
