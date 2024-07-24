#!/bin/bash

LOG_FILE="/var/log/devopsfetch/devopsfetch.log"

if [ -z "$1" ]; then
    echo "Displaying all active ports:" | tee -a $LOG_FILE
    sudo netstat -tuln | tee -a $LOG_FILE
else
    echo "Details for port $1:" | tee -a $LOG_FILE
    sudo netstat -tuln | grep ":$1" | tee -a $LOG_FILE
fi
