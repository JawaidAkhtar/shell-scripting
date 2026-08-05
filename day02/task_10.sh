#!/bin/bash
# This script checks if a given number is positive, negative, or zero.

NUM=$1

if [ -z "$NUM" ]; then
    echo "please provide a number"
    exit 1
fi


if [ "$NUM" -gt 0 ]; then
    echo "$NUM is positive number"
elif [ "$NUM" -eq 0 ]; then
    echo "$NUM is zero"
else
    echo "$NUM is negative number"
fi
