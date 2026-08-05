#!/bin/bash

#This script check if provided argumment file is exist or not and readable 

FILE="$1"

if [ -f "$FILE" ] && [ -r "$FILE" ]; then
    echo "$FILE exist and readable"
else
    echo "$FILE does not exist"
fi
