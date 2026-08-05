#!/bin/bash
# This script checks which is greater among two numbers.

NUM1=$1
NUM2=$2

if [ "$#" -ne 2 ]; then
    echo "USAGe: $0 num1 num2"
    exit 1
fi

if [ "$NUM1" -gt "$NUM2" ]; then
    echo "$NUM1 is greater than $NUM2"
elif [ "$NUM1" -eq "$NUM2" ]; then
    echo "$NUM1 is equal to $NUM2"
else
    echo "$NUM1 is less than $NUM2"
fi
