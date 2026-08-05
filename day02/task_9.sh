#!/bin/bash

NUM=$1
NUM2=$2
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 num1 num2"
else
    if [ $NUM -gt $NUM2 ]; then
        echo "$NUM is greater than $NUM2"
    else
        echo "$NUM is not greater than $NUM2"
    fi
fi