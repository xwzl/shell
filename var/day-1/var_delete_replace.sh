# /bin/bash
data="I love you,Do you love me"
echo $data

# 从变量开头进行规则匹配,将符合最短的数据删除
delete_start=${data#*ve}
echo $delete_start

# 从变量开头进行规则匹配,将符合最长的数据删除
delete_start_multiple=${data##*ve}
echo $delete_start_multiple

# 从变量尾部进行规则匹配,将符合最短的数据删除
delete_end=${data%ve*}
echo "$delete_end 从尾部删除"

# 从变量尾部进行规则匹配,将符合最长的数据删除
delete_end_multiple=${data%%ve*}
echo "delete_end_multiple"

# 变量内容符合旧字符串则,则第一个旧字符串会被新字符串取代
var_replace=${data/love/test}
echo  ${var_replace}

# ${变量名//旧字符串/新字符串}	变量内容符合旧字符串则,则全部的旧字符串会被新字符串取代
var_replace=${data//love/test}
echo  ${var_replace}

echo ${PATH}

change_path=${PATH/bin/BIN}
echo $change_path

change_path=${PATH//bin/BIN}
echo $change_path

echo ${PATH}
