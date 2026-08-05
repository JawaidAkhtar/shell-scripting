#!/bin/bash

NUM=$1
NUM2=$2
if [ $NUM -gt $NUM2 ]; then
    echo "$NUM is greater than $NUM2"
else
    echo "$NUM is not greater than $NUM2"
fi