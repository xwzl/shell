#!/bin/bash
user="xuweizhi"
password="123456"
host="47.105.218.58"

db_name="$1"
SQL="$2"

mysql -u"$user" -p"$password" -h"$host" -D "$db_name" -B -e "$2"