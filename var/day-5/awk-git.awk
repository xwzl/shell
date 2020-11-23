BEGIN {
        FS="/"
}
{
    if( match($0,/^\/d/)==1 )
        system("cd "$0";pwd;git remote set-url origin http://192.192.192.56:9990/tcjkbackend/"$NF".git;")
}
