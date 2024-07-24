#!/bin/bash

LOG_FILE="/var/log/devopsfetch/devopsfetch.log"

# Ensure the log file directory exists
mkdir -p $(dirname $LOG_FILE)

# List all Nginx domains by displaying the configuration files
list_nginx_domains() {
    echo "Listing all Nginx domains:" | tee -a $LOG_FILE
    sudo nginx -T 2>> $LOG_FILE
}

# Get details for a specific Nginx domain
get_nginx_domain_details() {
    local domain=$1
    echo "Details for domain $domain:" | tee -a $LOG_FILE
    sudo grep -r "$domain" /etc/nginx/sites-available/ 2>> $LOG_FILE
}

# Check if the argument is 'all' or a specific domain
if [[ $1 == "all" ]]; then
    list_nginx_domains
else
    if [ -z "$1" ]; then
        echo "Error: No domain specified" | tee -a $LOG_FILE
        echo "Usage: $0 [domain]" | tee -a $LOG_FILE
        exit 1
    fi
    get_nginx_domain_details "$1"
fi
