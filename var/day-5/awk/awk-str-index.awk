BEGIN{
    dream="I have a dream";

    location=index(dream,"ea");
    print location;

    match_location=match(dream,"ea");
    print match_location;

    # 小写转换
    print tolower(dream);

    # 大写转换
    print toupper(dream);

    # 以空格作为分隔符，数据存储在 arr 中,默认为空格分隔
    split(dream,arr," ");

    # 下标从 1 开始
    for( a in arr ){
        print arr[a]
    }

    nginx="Nginx is start of 2020;";
    # 正则表达式匹配，第一个出现字符的位置
    l=match(nginx,/[0,9]/);
    print l

    # 从第四位截取第五位字符串
    newStr=substr(nginx,4,5)
    print newStr

    # 正则表达式替换，只替换第一个数字
    number_str="This is number word!553 553 553"
    # 返回替换的个数

    print sub(/[0-9]+/,"$",number_str)
    print number_str

    # 替换所有,返回替换的个数
    print gsub(/[0-9]+/,"$",number_str)
    print number_str
}
