#!/bin/bash

USERID=$(id -u)
logs_folder="/var/log/shellscript-logs"    /* Corrected folder name to match script purpose */
script_name=$(echo $0 | cut -d '.' -f1)    /* Corrected to use $0 for script name */
log_file="$logs_folder/$script_name.log"   /* Corrected date format */

mkdir -p $logs_folder
echo "script started at $(date)" : | tee -a $log_file
if [ $USERID -ne 0 ]; then
    echo "You are not a root user. please run the script with root access."  | tee -a $log_file
    exit 1
else
    echo "You are a root user hence proceeding with the installation."   | tee -a $log_file
fi  
validate_installation() {
    if [ $1 -ne 0 ]; then
        echo "$2 failed to install."  | tee -a $log_file
        exit 1
    else
        echo "$2 installed successfully."  | tee -a $log_file
    fi
}

install_package() {
    PACKAGE=$1
    if ! dpkg -l | grep -q "^ii  $PACKAGE "; then
        echo "$PACKAGE was not installed. Proceeding with installation..."  | tee -a $log_file
        apt install -y $PACKAGE
        validate_installation $? "$PACKAGE"
    else
        echo "$PACKAGE is already installed."  | tee -a $log_file
    fi
}           

# Check and install packages
install_package apache2
install_package mysql-server
install_package php
install_package curl

echo "script ended at: $(date)"  | tee -a $log_file    



