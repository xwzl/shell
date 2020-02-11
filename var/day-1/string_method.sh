data="Hello World!"

# # 获取字符串长度
len=${#data}
echo "${len}"

# string 有空格，则必须加双引号
data="hello text"
len=$(expr length "${data}")
echo "${len}"

# string 有空格，则必须加双引号
data="hello qq"
len=`expr length "${data}"`
echo "${len}"

# 获取子字符串索引的位置
len=$(expr index "${data}" qq)
echo "${len}"

# 特别注意，这里不是返回子字符串的位置，而是返回子字符串第一个匹配的字符位置
index=$(expr index "${data}" le)
echo "子字符串中第一个匹配字符的位置：${index}"

# 获取子字符串索引的长度
len=$(expr match "${data}" qq)
echo "${len}"

# 必须从头开始匹配，不常用
len=$(expr match "${data}" hel)
echo "${len}"

len=$(expr match "${data}" hel.*)
echo "${len}"

data="Today is a good day!Are you ok?"
# 截取字符串，索引下标从 0 开始
echo "${data:6}"
echo "${data:6:12}"
# 注意有一个空格
echo "${data: -5}"
echo "${data:(-5):2}"
# 索引下标从 1 开始计算
echo "$(expr substr "${data}" 7 12)"
