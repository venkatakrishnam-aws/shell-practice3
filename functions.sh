#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You are not a root user. please run the script with root access."
    exit 1
else
    echo "You are a root user hence proceeding with the installation."
fi

validate_installation() {
     if [ $1 -ne 0 ]; then
        echo "$2 failed to install."
        exit 1
    else
        echo "$2 installed successfully."
    fi
}


apt list --installed mysql-server

    if [ $? -ne 0 ]; then
        echo "$1 was not installed and now we are proceeding with the installation of $1."
        apt install $1 -y
        validate=$? "$1 installation"
        exit $validate
    else
        echo "$1 installed already."
    fi
apt list --installed nginx

    if [ $? -ne 0 ]; then
        echo "$1 was not installed and now we are proceeding with the installation of $1."
        apt install $1 -y
        validate=$? "$1 installation"
        exit $validate
    else
        echo "$1 installed already."
    fi
apt list --installed python3-pip
    if [ $? -ne 0 ]; then
        echo "$1 was not installed and now we are proceeding with the installation of $1."
        apt install $1 -y
        validate=$? "$1 installation"
        exit $validate
    else
        echo "$1 installed already."
    fi

