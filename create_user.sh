#!/bin/bash

<< comment 
this is multi line comment
anything written here will not be execute
comment

#Take input from user
read -p "Enter your username: " username

#Display on screen
echo "you have entered $username as your username"

#add user
sudo useradd -m $username 
echo "$username user added successfully"

#setting password for newly created user
echo "Enter a password for $username"
sudo passwd $username

