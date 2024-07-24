#!/bin/bash

LOG_FILE="/var/log/devopsfetch/devopsfetch.log"

display_help() {
    echo "Usage: $0 [option] [argument]" | tee -a $LOG_FILE
    echo | tee -a $LOG_FILE
    echo "Options:" | tee -a $LOG_FILE
    echo "  -p, --port [port_number]     Display active ports or details of a specific port" | tee -a $LOG_FILE
    echo "  -d, --docker [container_name] List Docker images and containers or details of a specific container" | tee -a $LOG_FILE
    echo "  -n, --nginx [domain]         Display Nginx domains and ports or details of a specific domain" | tee -a $LOG_FILE
    echo "  -u, --users [username]       List users and last login times or details of a specific user" | tee -a $LOG_FILE
    echo "  -h, --help                   Display this help message" | tee -a $LOG_FILE
    echo | tee -a $LOG_FILE
    exit 1
}

while true; do
    echo "Script started at $(date)" >> $LOG_FILE

    case "$1" in
        -p|--port)
            shift
            /home/wole/devopsfetch/scripts/ports.sh "$@" | tee -a $LOG_FILE
            ;;
        -d|--docker)
            shift
            /home/wole/devopsfetch/scripts/docker_info.sh "$@" | tee -a $LOG_FILE
            ;;
        -n|--nginx)
            shift
            /home/wole/devopsfetch/scripts/nginx_info.sh "$@" | tee -a $LOG_FILE
            ;;
        -u|--users)
            shift
            /home/wole/devopsfetch/scripts/users_info.sh "$@" | tee -a $LOG_FILE
            ;;
        -h|--help)
            display_help
            ;;
        *)
            echo "Error: Invalid option" | tee -a $LOG_FILE
            display_help
            ;;
    esac

    echo "Script ended at $(date)" >> $LOG_FILE
    sleep 60
done
