# 进入 ip 为 47.105.218.58 地址下 qq 的数据库，并执行相关脚本
mysql -h47.105.218.58 -uroot -proot qq > qq.sql

# 不以交互模式执行数据库 sql
mysql -uroot -proot -D qq -e "select * from title limit 10"

# -B 不打印相关信息 -N 不输出列信息
mysql -uroot -proot -B -D qq -e "select * from title limit 10"

# -B 默认分分隔符变成 table 键分割
mysql -uroot -proot -D qq -N -B -e "select * from title limit 10"

# -E 行输出变为列输出
mysql -uroot -proot -D qq -N -E -B -e "select * from title limit 10"
# -H 以 html 输出
mysql -uroot -proot -D qq -N -H -B -e "select * from title limit 10"
# -X 以 xml 输出
mysql -uroot -proot -D qq -N -X -B -e "select * from title limit 10"

show databases;

show tables;
