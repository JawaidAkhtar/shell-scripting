#!/bin/bash
#This script take process name as argument and check status.

if [ "$#" -ne 1 ]; then
    echo "USAGE: $0 process_name"
    exit 1
fi

PROCESS="$1"

if pgrep "$PROCESS" > /dev/null 2>&1; then
    echo "$PROCESS is running..."
else
    echo "$PROCESS is not running"
fi 
