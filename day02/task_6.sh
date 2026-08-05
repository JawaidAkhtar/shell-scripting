#!/bin/bash


USERNAME=$1

if [ -z "$USERNAME" ]; then  #-z checks the argument is empty( -z means empty string) 
    
    echo "username is empty"

else
    echo "your username is $USERNAME"
fi