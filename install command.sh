#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You are not root user please run the script with root access."
    exit 1
else
    echo "You are a root user."
fi

sudo apt install mysql-server


