# 需求描述:
# 变量 string ="Bigdata process framwork is Hadoop,Hadoop is an open source project"
# 执行脚本后，打印输出 sttring 字符串变量，并给用户以下选项：
#
#   1、打印 string 长度
#   2、删除字符串中有的 Hadoop
#   3、替换 第一个 Hadoop 为 Mapreduce
#   4、替换全部 Hadoop 为 Mapreduce
#
# 用户输入数值 1|2|3|4,可以执行 对应项的功能：输入 q|Q 则退出交互模式
string="Bigdata process framwork is Hadoop,Hadoop is an open source project"

function print_tips() {
  echo "*******************************"
  echo "1、打印 string 长度"
  echo "2、删除字符串中有的 Hadoop"
  echo "3、替换第一个 Hadoop 为 Mapreduce"
  echo "4、替换全部 Hadoop 为 Mapreduce"
  echo "*******************************"
}

function len_of_string() {
  echo "${#string}"
}

function del_hadoop() {
  # 用空空串来代替删除 Hadoop 的功能
  echo "${string//Hadoop/}"
}

function rep_hadoop_first() {
  echo "${string/Hadoop/Mapreduce}"
}

function rep_hadoop_all() {
  echo "${string//Hadoop/Mapreduce}"
}

while true; do
  echo "[string=${string}]"
  echo
  print_tips
  # 标准输入并赋值给 choice
  # shellcheck disable=SC2162
  read -p "Pls input your choice(1|2|3|4|q|Q): " choice

  case $choice in
  1)
    len_of_string
    ;;
  2)
    del_hadoop
    ;;
  3)
    rep_hadoop_first
    ;;
  4)
    rep_hadoop_all
    ;;
  q | Q)
    exit
    ;;
  *)
    echo "Error,input only in (1|2|3|4|q|Q)"
    ;;
  esac

  echo

done
