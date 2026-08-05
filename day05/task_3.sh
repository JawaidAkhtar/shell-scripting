#!/bin/bash
#This script take argument for functions, validate and check services.

validate_input() {
    if [ "$#" -eq 0 ]; then
        echo "USAGE: $0 service_name"
        exit 1
    fi
}

check_service() {
    for service in "$@"
    do
        echo "=================Checking services status================="
        systemctl is-active "$service"
    done
}

main() {
    validate_input "$@"
    check_service "$@"
}

main "$@"