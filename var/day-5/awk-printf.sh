#!/bin/bash
#  $0	整行内容
#  $1-$n	当前行的第 1-n 个字段，以分隔符(FS)作为字段切分
#  NF	当前行的字段个数,也就是有多少列，分割后的数量
#  NR	当前行的行号,从1开始计数(多个文件计算时，行数会累加)
#  FNR	多文件处理时,每个文件行号单独计数,都是从0开始
#  FS	输入字段分隔符。不指定默认以空格或tab键分割
#  RS	输入行分隔符。默认回车换行
#  OFS	输出字段分隔符。默认为空格
#  ORS	输出行分隔符。默认为回车换行
#  FILENAME	当前输入的文件名字
#  ARGC	命令行参数个数
#  ARGV	命令行参数数组
file_name="$(pwd)/data.txt"

if [ ! -f "${file_name}" ]; then
    # shellcheck disable=SC2129
    echo "/usr/bin:root:pasword:1125" >>"${file_name}"
    echo "/usr/bin:roots:intel@123:112316" >>"${file_name}"
    echo "/usr/bin:admin:123456:13137" >>"${file_name}"
    echo "/usr/bin:awk:five:1448" >>"${file_name}"
fi

#awk 'BEGIN{FS=":"}{printf $1 " row number " NR "\n"}' "${file_name}"

# %s 相当于一个占位符,逗号作为间隔，20 代表字符填充，- 表示左对齐，默认右对齐
#awk 'BEGIN{FS=":"}{printf "%-20s %-20s\n",$1,NR}' "${file_name}"

# 10 进制，15 位数字
#awk 'BEGIN{FS=":"}{printf "%-15d\n",NR}' "${file_name}"
# 16 进制，15 位数字
#awk 'BEGIN{FS=":"}{printf "%#-15x\n",NR}' "${file_name}"
# 8 进制，15 位数字
#awk 'BEGIN{FS=":"}{printf "%#-15o\n",$4}' "${file_name}
# 浮点数
#awk 'BEGIN{FS=":"}{printf "%f\n",$4}' "${file_name}"
awk 'BEGIN{FS=":"}{printf "%e\n",$4}' "${file_name}"

rm -rf "${file_name}"
