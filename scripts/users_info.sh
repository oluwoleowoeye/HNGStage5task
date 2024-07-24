#!/bin/bash

list_users() {
    awk -F':' '{ print $1 }' /etc/passwd
}

get_user_details() {
    local username=$1
    grep "^${username}:" /etc/passwd
    last $username
}

if [[ $1 == "all" ]]; then
    list_users
else
    get_user_details $1
fi
