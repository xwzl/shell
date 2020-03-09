#!/bin/bash
. ./../common/print.lib

file_name="$(pwd)/sed-append.txt"

function create_file() {
  if [ ! -f "${file_name}" ]; then
    echo "sed-data.txt is not exist! Create ${file_name}"
    # shellcheck disable=SC2129
    echo "I love python,but I also love java" >>"${file_name}"
    echo "I love PYTHON" >>"${file_name}"
    echo "/sbin/log:root,password" >>"${file_name}"
  fi
}

create_file

head "sed 内容追加之行后追加 a => append"
delimiter
echo "在第 2 行后面追加文件"
sed -i "2a This is the appended character!" "${file_name}"
#cat "${file_name}"

delimiter
echo "在第 2 行到 3 行，每一行后面追加内容"
sed -i "2,4a Test line Bebind" "${file_name}"
#cat "${file_name}"

delimiter
echo "匹配到的内容行后面追加内容"
sed -i "/\/sbin\/log/a 匹配行的后面追加内容" "${file_name}"
#cat "${file_name}"

rm -rf "${file_name}"

create_file
head "sed 行前追加内容 i"
delimiter
sed -i "/^I/i 以 I 开头的行前追加内容" "${file_name}"
sed -i "2,3i 2 to 3 行前追加内容" "${file_name}"
#cat "${file_name}"

rm -rf "${file_name}"

create_file "r 外部文件追加内容"
delimiter
echo "指定行后追加外部文件内容"
sed -i "2r $(pwd)/other.txt" "${file_name}"
echo "匹配的内容后面追歼外部文件内容，一次匹配增加一次"
sed -i "/^I/r $(pwd)/other.txt" "${file_name}"
cat "${file_name}"

echo "将匹配到的内容写到外部文件中,降低文件处理的复杂度"
sed -i "/^I/w $(pwd)/data.txt" "${file_name}"
rm -rf "${file_name}"
