BEGIN{
    #  awk -f awk-statics.awk data-insert.txt
    printf "%-10s%-20s%-20s%-20s\n","User","Total Records","Success Records","Failed Records"
}
{
    # awk 默认分隔符为空格，以第六列名称数据作为 key,其插入数值为 value 进行相加
    TOTAL[$6]+=$8
    SUCCESS[$6]+=$13
    FAILED[$6]+=$17

}
END{
    for(total in TOTAL){
          sum_t+=TOTAL[total]
          sum_s+=SUCCESS[total]
          sum_f+=FAILED[total]
          printf "%-10s%-20d%-20d%-20d\n",total,TOTAL[total],SUCCESS[total],FAILED[total]
    }
     printf "%-10s%-20d%-20d%-20d\n","",sum_t,sum_s,sum_f
}
