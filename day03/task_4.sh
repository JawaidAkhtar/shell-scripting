#!/bin/bash
#This script is for checking nginx log file is available or not and print last 5 lines of it.

LOG_FILE="/var/log/nginx/access.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Nginx not installed or access log missing"
    exit 1
fi

echo "Listing the last 5 line of nginx log file..."
tail -n 5 "$LOG_FILE"