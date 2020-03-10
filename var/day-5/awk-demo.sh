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
    echo "/usr/bin:root:pasword" >>"${file_name}"
    echo "/usr/bin:roots:intel@123" >>"${file_name}"
    echo "/usr/bin:admin:123456" >>"${file_name}"
    echo "/usr/bin:awk:five" >>"${file_name}"
fi

# awk 中必须使用单引号，$0 表示匹配到的每一行数据
#awk '{print $0}' "${file_name}"

# $1-$n	当前行的第 1-n 个字段，以分隔符(FS)作为字段切分
# 对每行的内容以 ！ 作为分隔，$0 匹配所有的内容，$1 输出每一行分割后第一个字段，$2 输出每一行分割后第2个字段
# FS 默认的分隔符为空格
#awk 'BEGIN{FS=":"}{print $3}' "${file_name}"

#  NF	当前行的字段个数,也就是有多少列，分割后的数量
#awk 'BEGIN{FS=":"}{print NF}' "${file_name}"

#  NR	当前行的行号,从1开始计数(多个文件计算时，行数会累加)
#awk 'BEGIN{FS=":"}{print NR}' "${file_name}" "${file_name}"

#  FNR	多文件处理时,每个文件行号单独计数,都是从0开始
#awk 'BEGIN{FS=":"}{print FNR}' "${file_name}" "${file_name}"

# RS	输入行分隔符。\n
# --- 输入行进行分割;
# ：输入字段之间进行分割；
# #  控制台输出的分隔符;
# : 控制台输出的字段分隔符；
#awk 'BEGIN{RS="---";FS=":";ORS="#";OFS=":"}{print $1,$2}' source

# FILENAME 打印文件名称，每一行输出都会打印名称
#awk '{print FILENAME}' "${file_name}"

#  ARGC	命令行参数个数
awk '{print ARGC}' "${file_name}"

#  ARGV	命令行参数数组
awk '{print ARGV}' "${file_name}"

rm -rf "${file_name}"
