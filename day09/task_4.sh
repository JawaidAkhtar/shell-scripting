#!/bin/bash
#This script is for log rotation

set -euo pipefail

LOG_FILE="server_health.log"

check_disk() {
    echo "checking disk usage..."
    THRESHOLD=80

    df -P | tail -n +2 | while read line
    do
        USAGE=$(echo "$line" | awk '{print $6}' | tr -d '%')
        PARTITION=$(echo "$line" | awk '{print $7}')

        if [ "$USAGE" -gt "$THRESHOLD" ]; then
            echo "⚠️ ALERT: $PARTITION disk usage is ${USAGE}% (Above threshold)"
        else
            echo "NORMAL: $PARTITION --> ${USAGE}% is consumed"
        fi
    done

}

check_services() {
    echo "checking services status..."

    SERVICES=("nginx" "ssd" "docker")

    for service in "${SERVICES[@]}"
    do
        if pgrep "$service" > /dev/null 2>&1; then
            echo "$service is running..."
        else
            echo "$service is not running..."
        fi
    done
}

check_connectivity() {
    echo "checking network connection status..."
    SERVER=("www.google.com" "www.github.com" "www.youtube.com")

    for server in "${SERVER[@]}"
    do
        if ping  "$server" > /dev/null 2>&1; then
            echo "$server is reachable"
        else
            echo "$server is not reachable"
        fi
    done

}

log_rotate(){

    LOG_SIZE=$(du -k "$LOG_FILE" | awk '{print $1}')

    if [ "$LOG_SIZE" -gt 1024 ]; then
        mv "$LOG_FILE" "${LOG_FILE}.old"
        touch "$LOG_FILE"
        echo "log rotated successfully"
    fi

}

main() {
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

log_rotate

} | tee -a "$LOG_FILE"
}

main



