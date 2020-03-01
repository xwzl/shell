#!/bin/bash
#  sed 中编辑命令
#  查询	p	打印
#  增加	a	行后追加
#  增加	i	行前追加
#  增加	r	外部文件读入，行后追加
#  增加	w	匹配行写入外部文件
#  删除	d	删除
#  修改	s/old/new	将行内第一个 old 替换为 new
#  修改	s/old/new/g	将行内全部 old 替换为 new
#  修改	s/old/new/2g	将行内前两个 old 替换为 new
#  修改	s/old/new/ig	将行内前两个 old 替换为 new,忽略大小写
. ./../common/print.lib

data_name="$(pwd)/sed-common-data.txt"

rm -rf "${data_name}"

# shellcheck disable=SC1072
if [ ! -f "${data_name}" ]; then
  # shellcheck disable=SC2129
  echo "/bin/bash:demo1.sh" >>"${data_name}"
  echo "/bin/bash:demo2.sh" >>"${data_name}"
  echo "/bin/bash:demo3.sh" >>"${data_name}"
  echo "/sbin/bash:demo1.sh" >>"${data_name}"
  echo "/sbin/bash:demo2.sh" >>"${data_name}"
  echo "/sbin/bash:demo3.sh" >>"${data_name}"
  echo "/sbin/bash:demo4.sh" >>"${data_name}"
  echo "mail" >>"${data_name}"
  echo "sex" >>"${data_name}"
  echo "ftp" >>"${data_name}"
  echo "ftq" >>"${data_name}"
  echo "why" >>"${data_name}"
  echo "qq" >>"${data_name}"
  echo "txt txt TXT txt TXT txt" >>"${data_name}"
  echo "txt1 txt1 TXT1 txt1 TXT1 txt1" >>"${data_name}"
  echo "txt2 txt2 txt2 txt2 txt2 txt2" >>"${data_name}"
  echo "txt3 txt3 TXT3 txt3 TXT3 txt3" >>"${data_name}"
fi

# 删除第一行信息,-i 直接修改文件信息
# sed -i "1d" "${data_name}"

delimiter
echo "-d 参数，删除指定行数据"
sed "1d" "${data_name}"

delimiter
echo "删除匹配到的行数,\/bin\/bash 为转义字符"
sed -i "/\/bin\/bash/d" "${data_name}"

# 删除 mail 到 ftp 行的数据
sed -i "/mail/,/ftp/d" "${data_name}"

# 另起一行，输入的字符串 a 后需要增加一个空格，固定写法
delimiter
echo "固定写法：a 命令与追加的内容中间有一个空格间隔"
sed -i "/ftq/a 向匹配到的 ftp 开头的行后追加数据" "${data_name}"

delimiter
echo "固定写法：i 命令与追加的内容中间有一个空格间隔"
sed -i "/ftq/i 行前追加" "${data_name}"

# 将后面指定文件的内容追加到匹配到的行后面,默认是当前路径
delimiter
echo "固定写法：r 命令与追加的内容中间有一个空格间隔"
sed -i "/ftq/r config.init" "${data_name}"

# 将匹配到的行内容另存到其他文件中,默认是当前路径
delimiter
echo "固定写法：w 命令与追加的内容中间有一个空格间隔"
sed -i "/ftq/w other.txt" "${data_name}"

# 修改替换
delimiter
echo "替换语法：s/pattern/string/ ，默认替换每行第一个匹配到的内容"

# 查找并替换，查找符合 pattern 模式的字符串，将其第一个匹配的内容替换
sed -i "s/txt/hello/" "${data_name}"
# g 表示全部匹配的都替换
sed -i "s/txt1/hello1/g" "${data_name}"
# 4g 表示同一行，除开前 1 到 4 个匹配的内容(除开第一个)，其它匹配项替换为 hello2
# hello2 txt2 txt2 txt2 hello2 hello2
sed -i "s/txt2/hello2/4g" "${data_name}"
# 加 i 参数表示匹配时忽略大小写，g 表示匹配到的全部替换
sed -i "s/txt3/hello3/ig" "${data_name}"

delimiter
echo "= 显示行号"
sed -n "/\/sbin/=" "${data_name}"


