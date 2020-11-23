BEGIN {
        FS="/"
}
{
    #system("git remote show origin")

    # 正则表达式匹配，第一个出现字符的位置
    if( match($0,/^\/d/)==1 )

        system("cd ./$(NF-1)/$(NF)")
        system("git remote set-url origin http://125.69.0.69:9990/tcjkbackend/$(NF).git")
        system("cd ../../")
}
