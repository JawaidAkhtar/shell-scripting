#!/bin/bash

filename=$1
start_range=$2
end_range=$3

for (( num=start_range; num<=end_range; num++ ))
do
    rm $filename$num
done

