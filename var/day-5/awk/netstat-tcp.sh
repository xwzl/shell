# 统计主机上所有的 tcp 连接状态数，按照每个 TCP 状态分类
netstat -an | grep TCP | awk '{array[$4]++}END{for(a in array) print a,array[a]}'
