#!/bin/bash

# Asking the user to enter the UserName
read -p "Enter the user name: " user

# Search for all activities related to the user registered in the authentication log file
awk -v username="$user" '$0 ~ username' /var/log/auth.log > /home/reem/ActivitiesLog.txt

# tells the user where the file will be saved and its name 
echo "All the file that is related to user $user is saved in the file ActivitiesLog.txt under the home directory"
