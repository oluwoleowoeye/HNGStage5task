#!/bin/bash

LOG_FILE="/var/log/devopsfetch/docker_info.log"

list_docker_images_and_containers() {
    echo "Docker Images:"
    docker images
    echo
    echo "Docker Containers:"
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
}

get_docker_container_details() {
    if [ -z "$1" ]; then
        echo "Error: No container name or ID provided."
        echo "Usage: $0 -d 31355a0ded90"
        exit 1
    fi
    local container_name=$1
    docker inspect "$container_name"
}

# Check if argument is provided
if [ "$1" == "all" ]; then
    list_docker_images_and_containers
else
    get_docker_container_details "$1"
fi

