#!/bin/bash

USERID=$(id -u)
R='\033[0;31m' # Red color code
NC='\033[0m'   # No Color code
G='\033[0;32m' # Green color code
Y='\033[0;33m' # Yellow color code

if [ $USERID -eq 0 ]; then
    echo "$G You are a root user, proceeding with installation."
else
    echo -e "$R You are not a root user. Please run the script with root access. $NC"
    exit 1     
fi
validate_installation() {
    if [ $1 -ne 0 ]; then
        echo -e "$R $2 failed to install. $NC"
        exit 1
    else
        echo -e "$G $2 installed successfully. $NC"
    fi
}   

validate_package() {
    PACKAGE=$1
    if ! dpkg -l | grep -q "^ii  $PACKAGE "; then
        echo -e "$Y $PACKAGE was not installed. Proceeding with installation... $NC"
        apt install -y $PACKAGE
        validate_installation $? "$PACKAGE"
    else
        echo -e "$G $PACKAGE is already installed. $NC"
    fi
}

# Check and install packages

validate_package php
validate_package curl
validate_package wget

