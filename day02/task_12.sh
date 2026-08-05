#!/bin/bash
#This script checks the Disk Usage and give alert

USAGE=$(df -h / | awk 'NR==2 {print $6}' | sed 's/%//')

if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk Usage is ${USAGE}%"
else
    echo "OK: Disk Usage is ${USAGE}%"
fi
