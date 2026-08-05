#!/bin/bash
#This script prints disk usage.

USAGE=$(df -h / | awk 'NR==2 {print $6}' | sed 's/%//')

if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is $USAGE"
else
    echo "NORMAL: Disk usage is $USAGE"
fi
