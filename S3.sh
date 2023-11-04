#!/bin/bash

# Asking the user to enter the UserName
read -p "Enter the username: " username

# Check if the user exists or not
if id "$username" &>/dev/null; then
    echo "Top 5 running processes for user $username consuming the most memory:"
else
    echo "User $username does not exist."
    exit 1
fi

# to list the top 5 processes for the given user consuming the most memory
ps -U "$username" -o pid,ppid,%mem,cmd --sort=-%mem | head -n 6
#ps = command to get running process, pid = process ID , ppid = parent process ID
