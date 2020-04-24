#!/bash/bin
# Define Variables
HOME_DIR="$(pwd)"
CONFIG_FILE="process.cfg"
# 脚本本身的进程 id，用于过滤脚本子进程 id
this_pid="$$"

#echo "${HOME_DIR}"

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
  # awk 中不能直接外部参数，需要使用 -v 参数传递外部参数
  # $1 代表函数传入的参数，$2 是 awk 处理的数据后锁返回的数据列
  if [ $(ps -ef | awk -v pid=$1 '$2==pid{print }' | wc -l) -eq 1 ]; then
    pro_status="RUNNING"
  else
    pro_status="STOPPED"
  fi
  # ps aux 中第二列为 pid,第三列为 cpu 使用率，第四列为 men 使用率
  pro_cpu=$(ps aux | awk -v pid=$1 '$2==pid{print $3}')
  pro_mem=$(ps aux | awk -v pid=$1 '$2==pid{print $4}')
  pro_start_time=$(ps -p $1 -o lstart | grep -v STARTED)
}

#
function get_all_process_by_group() {
  is_group_in_config $1
  if [ $? -eq 0 ]; then
    p_lists=$(sed -n "/\[$1\]/,/\[.*\]/p" "${HOME_DIR}/${CONFIG_FILE}" | egrep -v "(^$|^#|\[.*\])")
    echo "$p_lists"
  else
    echo "Group name $1 is not in process.cfg"
  fi

}

# 判断组是否在配置文件中
function is_group_in_config() {
  for gn in $(get_all_group); do
    # 字符串需要用 == 比较，数字用 -eq
    if [ "$gn" == "$1" ]; then
      return
    fi
  done
  return 1

}

# 根据进程名称获取组名
function get_group_by_process_name() {
  for gn in $(get_all_group); do
    for pn in $(get_all_process_by_group $gn); do
      if [ "$pn" == "$1" ]; then
        echo "$gn"
      fi
    done
  done
}

function format_print() {
  ps -ef | grep $1 | grep -v grep | grep -v $this_pid &>/dev/null
  if [ $? -eq 0 ]; then
    p_ids=$(get_process_pid_by_name $1)
    for p_id in $p_ids; do
      get_process_info_by_pid $p_id
      # 有空格需要加 ""
      awk -v p_name=$1 \
      -v g_name=$2 \
      -v p_status=$pro_status \
      -v p_cpu=$pro_cpu \
      -v p_mem=$pro_mem \
      -v pId=$p_id \
      -v p_start_time="$pro_start_time" \
      'BEGIN{printf "%-20s%-12s%-10s%-6s%-7s%-10s%-20s\n",p_name,g_name,p_status,pId,p_cpu,p_mem,p_start_time}'
    done
  else
    #    awk -v p_name=$1 'BEGIN{printf "%-10s",p_name}'
    awk -v p_name=$1 \
    -v g_name=$2 \
    -v p_status="STOPPED" \
    -v p_cpu="NULL" \
    -v p_mem="NULL" \
    -v pId="NULL" \
    -v p_start_time="NULL" \
    'BEGIN{printf "%-20s%-12s%-10s%-6s%-7s%-10s%-20s\n",p_name,g_name,p_status,pId,p_cpu,p_mem,p_start_time}'
  fi
}

function is_process_in_config() {
  for pn in $(get_all_process); do
    if [ $pn == $1 ]; then
      return
    fi
  done
  echo "process $1 not in process.config"
  return 1
}
if [ ! -e "${HOME_DIR}/${CONFIG_FILE}" ]; then
  echo "${CONFIG_FILE} is not exist.. Please check.."
  exit 1
fi

#get_all_group

#get_all_process

#is_group_in_config $1 && echo exist || echo not in exist
#get_all_process_by_group $1

awk 'BEGIN{printf "%-20s%-12s%-10s%-6s%-7s%-10s%-20s\n","ProcessName---------","GroupName---","Status----","PID---","CPU---","MEMORY---","StartTime---"}'
if [ $# -gt 0 ]; then
  if [ "$1" == "-g" ]; then
    # 移除脚本输入时的第一个参数 -g demo => demo
    shift
    # gn 代表的组名
    for gn in $@; do
      # 进程名
      for pn in $(get_all_process_by_group $gn); do
        # 格式化输出
        is_process_in_config $pn && format_print $pn $gn
      done
    done
  else
    # 参数不全，当做处理进程信息
    for pn in $@; do
      gn=$(get_group_by_process_name $pn)
      is_process_in_config $pn && format_print $pn $gn
    done
  fi
else
  for pn in $(get_all_process); do
    gn=$(get_group_by_process_name $pn)
    is_process_in_config $pn && format_print $pn $gn
  done
fi

#group_name=`get_group_by_process_name mysql`

#format_print mysql WEB
