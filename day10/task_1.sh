#!/bin/bash

set -euo pipefail

# Load config
source config.conf

# Lock file
LOCK_FILE="/tmp/health_check.lock"

if [ -f "$LOCK_FILE" ]; then
    echo "Script is already running..."
    exit 1
fi

touch "$LOCK_FILE"

# Ensure cleanup on exit
trap "rm -f $LOCK_FILE" EXIT

# Ensure log file exists
touch "$LOG_FILE"

# ------------------ FUNCTIONS ------------------

check_disk() {
    echo "checking disk usage..."

    df -P | tail -n +2 | while read line
    do
        USAGE=$(echo "$line" | awk '{print $5}' | tr -d '%')
        PARTITION=$(echo "$line" | awk '{print $6}')

        if [ "$USAGE" -gt "$THRESHOLD" ]; then
            echo "⚠️ ALERT: $PARTITION disk usage is ${USAGE}%"
        else
            echo "NORMAL: $PARTITION --> ${USAGE}% is consumed"
        fi
    done
}

check_services() {
    echo "checking services status..."

    for service in "${SERVICES[@]}"
    do
        if pgrep "$service" > /dev/null 2>&1; then
            echo "$service is running"
        else
            echo "$service is not running"
        fi
    done
}

check_connectivity() {
    echo "checking network connectivity..."

    for host in "${HOSTS[@]}"
    do
        if ping -c 1 "$host" > /dev/null 2>&1; then
            echo "$host is reachable"
        else
            echo "$host is not reachable"
        fi
    done
}

rotate_logs() {
    if [ -f "$LOG_FILE" ]; then
        LOG_SIZE=$(du -k "$LOG_FILE" | awk '{print $1}')

        if [ "$LOG_SIZE" -gt 1024 ]; then
            mv "$LOG_FILE" "${LOG_FILE}.old"
            touch "$LOG_FILE"
            echo "log rotated successfully"
        fi
    fi
}

# ------------------ MAIN ------------------

main() {

rotate_logs

{
echo "====== SERVER HEALTH REPORT ======"
echo "Date: $(date)"
echo "----------------------------------"

check_disk
echo

check_services
echo

check_connectivity
echo

} | tee -a "$LOG_FILE"

}

main