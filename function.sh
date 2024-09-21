#!/bin/bash

function check_identity() {
    read -p "Enter your name: " name

    if [ "$name" = "jawaid" ]; then
       echo "Welcome back Jawaid"
    else
       echo "Please define your identity"
    fi
}

check_identity