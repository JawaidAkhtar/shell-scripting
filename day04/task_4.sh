#!/bin/bash
#This script take services name as argument and check status.

if [ "$#" -eq 0 ]; then
    echo "USAGE: bash $0 sevice1 service2..."
    exit 1
fi

for service in "$@"
do
    systemctl is-active "$service"
done