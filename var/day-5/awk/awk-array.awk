BEGIN{
    # 定义数组
    books[1]="book";
    books[2]="java";
    books[3]="google";
    # 下标为 4 的值，初始化加 1
    books[4]++;
    books[4]++;
    delete books[2];


    for(book in books)
        printf "key:%s,value:%s\n",book,books[book]
}
