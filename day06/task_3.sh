#!/bin/bash
#This script find error from error.log file and prints count.

if [ "$#" -ne 1 ]; then
    echo "USAGE: $0 log_file"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "$LOG_FILE doesn't exist"
    exit 1
fi

COUNT=$(grep -i "error" $LOG_FILE | wc -l)

echo "Total Error count is $COUNT" 