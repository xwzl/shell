#!/usr/bin

#my_array=(A B "C" D)
#
#echo "第一个元素为: ${my_array[0]}"
#echo "第二个元素为: ${my_array[1]}"
#echo "第三个元素为: ${my_array[2]}"
#echo "第四个元素为: ${my_array[3]}"

# shellcheck disable=SC1068
books=("go" "java" "base" "java")

#for book in books; do
#  # shellcheck disable=SC2059
#  echo "${book}"
#done

# 打印数组中的元素值
echo "${books[1]}"

# 打印数组的长度
echo "${#books[@]}"

# 打印数组元素的长度
echo "${#books[1]}"

books[3]="qq"
echo "${books[3]}"

# 打印所有元素
echo "${books[@]}"

# 分片访问
echo "${books[@]:1:3}"

# 元素替换
#echo "${books[@]/e/E}"
#echo "${books[@]//e/E}"

# 1 代表 books 变量原始值所对应的下标
unset books[1]
echo "${books}"

unset books
echo "${books}"
