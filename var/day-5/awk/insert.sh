#!/bin/bash

function create_random() {
  min=$1
  # shellcheck disable=SC2004
  max=$(($2 - $min + 1))
  num=$(date +%s%N)
  # shellcheck disable=SC2004
  echo $((num % $max + $min))
}

INDEX=1

while true; do
  for user in Allen Mike Jarry Tracy Hanmeimei LiLei; do
    COUNT=$RANDOM
    NUM1=$(create_random 1 $COUNT)
    NUM2=$(expr $COUNT - $NUM1)
    echo "$(date '+%Y-%m-%d %H:%M:%S') $INDEX Batches: user $user inset $COUNT DATA INTO database.table 'test',Insert $NUM1 Records Sucessfully,failed Insert $NUM2 Records" >>./data-insert.txt
    INDEX=$(expr $INDEX + 1)
  done
done
