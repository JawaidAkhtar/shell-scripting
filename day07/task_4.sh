#!/bin/bash
#This script read disk usage line by line and send alert of each partition disk usage

THERESHOLD=40


df -h | tail -n +2 | while read line
do 
    USAGE=$(df -h | tail -n +2 | awk '{print $6}' | tr -d '%')
    PARTITION=$(df -h | tail -n +2 | awk '{print $7}')

    if [ "$USAGE" -gt "$THERESHOLD" ]; then
        echo "WARNING: $PARTITION disk usage is $USAGE"
    else
        echo "NORMAL: $PARTITION disk usage is $USAGE"
    fi
done



