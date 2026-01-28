#!/bin/bash 

USERID=$(id -u)
R='\033[0;31m' # Red color code
NC='\033[0m'   # No Color code
G='\033[0;32m' # Green color code
Y='\033[0;33m' # Yellow color code

logs_folder="/var/log/myscriptlogs"
scriptname=$(echo $0 | cut -d '.' -f1)
log_file="$logs_folder/${scriptname}_$(date +'%Y%m%d_%H%M%S').log"
mkdir -p /tmp/shell-script
echo script started at $(date) >> /tmp/shell-script/logs.txt 

if [ $USERID -eq 0 ]; then
    echo "$G You are a root user, proceeding with installation." &&>> /tmp/shell-script/logs.txt
else
    echo -e "$R You are not a root user. Please run the script with root access. $NC" &&>> /tmp/shell-script/logs.txt
    exit 1     
fi
validate_installation() {
    if [ $1 -ne 0 ]; then
        echo -e "$R $2 failed to install. $NC" &&>> /tmp/shell-script/logs.txt
        exit 1
    else
        echo -e "$G $2 installed successfully. $NC"  &&>> /tmp/shell-script/logs.txt
    fi  
}