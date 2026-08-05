#!/bin/bash
#This script taes filename as argument and print error in error.log file

if [ "$#" -eq 0 ]; then
    echo "USAGE: $0 filename"
    exit 1
fi

FILE="$1"

> error.log

if ls "$FILE" 2> error.log; then
    echo "File $FILE exist"
else
    echo "$FILE doesn't exist, check error.log"
fi