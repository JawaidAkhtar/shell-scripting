#!/bin/bash
#This script checks the argument count, directory exists, and list the directory.

DIR="$1"

if [ $# -ne 1 ]; then
    echo "USAGE: $0 Directory_name"
    exit 1
fi

if [ ! -d "$DIR" ]; then
    echo "$DIR does not  exist"
    exit 1
fi

echo "listing $DIR ..."
ls -t "$DIR"
    