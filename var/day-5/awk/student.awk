BEGIN{
    printf "%-10s%-10s%-10s%-10s%-10s%-10s\n","Name","Chinese","Math","English","Physical","Avg"
}

{
    total = $2 + $3 + $4 + $5
    avg = total / 4
    if(avg > 78){
        printf "%-10s%-10d%-10d%-10d%-10d%0.2f\n",$1,$2,$3,$4,$5,avg
        chinese_total+=$2
        math_total+=$3
        english_total+=$4
        physical_total+=$5
    }
}

END{
    printf "%-10s%-10d%-10d%-10d%-10d\n","",chinese_total,math_total,english_total,physical_total
}
