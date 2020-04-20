#!/bash/bin

db_user="xuwezhi"
db_password="123456"
db_host="47.105.218.58"

ftp_user="root"
ftp_password="root"
ftp_host="47.105.218.58"

src_dir="/data/back"
dst_dir="/data/back"

time_date="`date +%Y%m%d%H%M%S`"
file_name="school_score_${time_date}.sh"

function auto_ftp() {
  ftp -niv << EOF
      open $ftp_host
      user $ftp_user $ftp_password

      cd $dst_dir
      put $1
      bye
EOF
}

#echo "$time_date"

# 可能因为权限问题会失败
mysqldump -u"$db_user" -p"$db_password" -h"$db_host" school_score > ./$file_name && auto_ftp ./$file_name