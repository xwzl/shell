#!/bin/bash

. ./../common/print.lib

# 匹配模式
file_name="$(pwd)/data.txt"

if [ ! -f "${file_name}" ]; then
    # shellcheck disable=SC2129
    echo "/usr/bin:root:pasword:50" >>"${file_name}"
    echo "/usr/bin:roots:intel@123:81" >>"${file_name}"
    echo "/usrs/bin:admin:123456:52" >>"${file_name}"
    echo "/usrs/bin:awk:five1:60" >>"${file_name}"
    echo "/usrs/bin:awk:five2:75" >>"${file_name}"
    echo "/usrs/bin:awk:five3:49" >>"${file_name}"
fi

delimiter
echo "if 条件判断"
awk 'BEGIN{FS=":"}{if($4 > 50) {print $0 }}' "${file_name}"
# if 多条件判断
echo -e "多条件判断"
awk 'BEGIN{FS=":"}{
                  if($4 > 50 && $4 < 70){
                    printf "%-28s%-8s%-8d\n","大于50小于60的用户",$2,$4
                  }else if($4 > 80){
                    print "条件不满足"
                  }
                  }' "${file_name}"


rm -rf "${file_name}"
