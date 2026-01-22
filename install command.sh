#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]; then
    echo "You are root."
else
    echo "You are not root."
fi

sudo apt install mysql-server
systemctl start mysqld
systemctl enable mysqld

