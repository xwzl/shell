#!/bash/bin
# Define Variables
HOME_DIR="$(pwd)"
CONFIG_FILE="process.cfg"
# 脚本本身的进程 id，用于过滤脚本子进程 id
this_pid="$$"

echo "${HOME_DIR}"

# Func:Get Process Status In process.cfg
function get_all_group() {
  # 1. -n 取消默认打印，匹配 [GROUP_LIST] 开始，[任意字符]结束的数据信息
  # 2. grep -v "^$" 过滤以空格开始段落
  # 3. grep -v "^\[.*\]" 过滤组信息
  # sed -n '/\[GROUP_LIST\]/,/\[.*\]/p' "${HOME_DIR}/${CONFIG_FILE}" | grep -v "^$" | grep -v "^\[.*\]"
  # egrep 同时过滤满足正则表达式的条件，|无空格作为间隔
  G_LIST=$(sed -n '/\[GROUP_LIST\]/,/\[.*\]/p' "${HOME_DIR}/${CONFIG_FILE}" | egrep -v "(^$|\[.*\])")
  echo "${G_LIST}"

}

function get_all_process() {
  for a in $(get_all_group); do
    # seb 匹配中引用变量,尽量使用双引号 ""
    P_LIST=$(sed -n "/\[${a}\]/,/\[.*\]/p" "${HOME_DIR}/${CONFIG_FILE}" | egrep -v "(^$|\[.*\])")
    echo "${P_LIST}"
  done

}

# 进程名称获取对应的进程 id
function get_process_pid_by_name() {
  if [ $# -ne 1 ]; then
    return 1
  else
    # 找到对应参数的 pid,grep -v ${this_pid} 过滤自身和子进程的 pid,有可能过滤不干净，因此用 $0 过滤掉程序本身进程
    p_ids=$(ps -ef | grep $1 | grep -v grep | grep -v $0 | awk '{print $2}')
    echo "${p_ids}"
  fi
}

# 进程 id 获取对应的进程信息
function get_process_info_by_pid() {

}

if [ ! -e "${HOME_DIR}/${CONFIG_FILE}" ]; then
  echo "${CONFIG_FILE} is not exist.. Please check.."
  exit 1
fi

#p_list=$(get_all_process)
#
#echo "${p_list}"

get_process_pid_by_name $1

#for a in $(get_all_group); do
#  echo "${a}"
#done
#g_list=$(get_all_group)
#echo "${g_list}"
