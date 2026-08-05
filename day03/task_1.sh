#!/bin/bash
#This script check is file exist or not


FILE=$1

if [ "$" -eq 1 ]; then

    if [ -f "$FILE" ]; then
        echo "$FILE exists"
    fi

else
    echo "USAGE: bash $0 filename"
fi

