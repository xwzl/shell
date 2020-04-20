# 安装 mariadb 数据库
yum install -y mariadb mariadb-server

systemctl start mariadb

### 改变文件字符

set ff=unix

### 初始化连接

    mysql -u root
    use mysql;
    update user set password=password("root")where user='root';
    flush privileges;
    
    # 创建用户并授权
    grant all on qq.* xuweizhi@'%' identigied by '123456';
    
 ### 使用
 
    sh mysql-operate.sh qq "insert into user values(3,'jakc',12,'2008','女')"