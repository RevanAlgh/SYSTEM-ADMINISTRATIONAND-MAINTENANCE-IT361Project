#!/bin/bash

# Check if the port argument is given
if [ $# -eq 0 ]; then
  echo "Please provide a port number as an argument."
  exit 1
fi

# Get the port number from cmd line argument
port=$1

# Check if the firewall is enabled
firewall_status=$(sudo ufw status | grep "Status: active")

if [ -z "$firewall_status" ]; then
  echo "Firewall is not active."
else
# Check if the port is allowed in the ufw rules
  port_status=$(sudo ufw status | grep "$port")
  
# a message to indicate the status of the port
  if [ -z "$port_status" ]; then
    echo "Port $port is closed."
  else
    echo "Port $port is open."
  fi
fi
