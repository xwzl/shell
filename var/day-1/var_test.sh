data="data"
data1=
#  变量配置方式	str没有配置	Str为空字符串	Str已配置且非空
#  var=${str-expr}	var=expr	var=	var=$str
#  var=${str:-expr}	var=expr	var=expr	var=$str
#  var=${str+expr}	var=	var=expr	var=expr
#  var=${str:+expr}	var=	var=	var=expr
#  var=${str=expr}	var=expr	var=	var=$str
#  var={str:=expr}	var=expr	var=expr	var=$str

var=${data-hello}
echo $var

var=${data1-hello}
echo "$var"

var=${data2-hello}
echo "$var"

var1=${data:-hello}
echo $var1

var1=${data1:-hello}
echo "$var1"

var=${data2:-hello}
echo "$var1"
