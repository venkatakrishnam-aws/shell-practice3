#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You are not a root user. please run the script with root access."
    exit 1
else
    echo "You are a root user hence proceeding with the installation."
fi

apt list --installed | grep mysql-server &> /dev/null
 if [ $? -eq 0 ]; then
    echo "MySQL server is already installed."
    exit 0
    else
    echo "MySQL server is not installed. Proceeding with installation."
fi

sudo apt install mysql-server

if [ $? -ne 0 ]; then
    echo "MySQL server not installed, going to install it."
    exit 1
else
    echo "MySQLerver is installed successfully!."
    exit 0
fi


