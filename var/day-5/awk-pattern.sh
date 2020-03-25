#!/bin/bash
# 匹配模式
file_name="$(pwd)/data.txt"

if [ ! -f "${file_name}" ]; then
    # shellcheck disable=SC2129
    echo "/usr/bin:root:pasword:1125" >>"${file_name}"
    echo "/usr/bin:roots:intel@123:112316" >>"${file_name}"
    echo "/usrs/bin:admin:123456:13137" >>"${file_name}"
    echo "/usrs/bin:awk:five:1448" >>"${file_name}"
fi

# 匹配并打印行中包含 root 的信息列
#awk 'BEGIN{FS=":"}/root/{printf "%s\n",$0}' "${file_name}"

# 输出并打印以 /usrs 开头的行
#awk 'BEGIN{FS=":"}/^\/usrs/{printf "%s\n",$0}' "${file_name}"

# 以":"作为分隔符，匹配文件中第4个字段大于1500的所有行信息
#awk 'BEGIN{FS=":"}$4>1500{print $0}' "${file_name}"

# 以":"作为分隔符，第2列为admin的所有行信息
#awk 'BEGIN{FS=":"}$2=="admin"{print $0}' "${file_name}"

# 以":"作为分隔符，第2行不为admin的所有行信息
#awk 'BEGIN{FS=":"}$2!="admin"{print $0}' "${file_name}"

# 以":"作为分隔符，第4个字段为5位数以上的所有行信息
#awk 'BEGIN{FS=":"}$4~/[0,9]{3,}/{print $0}' "${file_name}"

# 以":"作为分隔符， ~ //正则表达式
#awk 'BEGIN{FS=":"}$2~/admin/{print $0}' "${file_name}"

# 以":"作为分隔符， !~ // 不匹配正则表达式
#awk 'BEGIN{FS=":"}$2~/admin/{print $0}' "${file_name}"

# 布尔运算 || && !
awk 'BEGIN{FS=":"}$2=="admin" || $2=="awk"{print $0}' "${file_name}"

rm -rf "${file_name}"
