#!/bin/bash
#This script prints date into a new file and append every time script executes.

if [ ! -e "date.txt" ]; then
    echo "date.txt file does't exist, creatinf file..."
    touch date.txt
    echo "date.txt file created successfully"
fi

date >> date.txt

if [ "$?" -eq 0 ]; then
    echo "Date printed successfully in date.txt file"
else
    echo "Date not printed in date.txt file"
fi