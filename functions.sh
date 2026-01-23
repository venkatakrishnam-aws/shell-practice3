#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You are not a root user. Please run the script with root access."
    exit 1
else
    echo "You are a root user, proceeding with installation."
fi

validate_installation() {
    if [ $1 -ne 0 ]; then
        echo "$2 failed to install."
        exit 1
    else
        echo "$2 installed successfully."
    fi
}

install_package() {
    PACKAGE=$1
    if ! dpkg -l | grep -q "^ii  $PACKAGE "; then
        echo "$PACKAGE was not installed. Proceeding with installation..."
        apt install -y $PACKAGE
        validate_installation $? "$PACKAGE"
    else
        echo "$PACKAGE is already installed."
    fi
}

# Check and install packages
install_package apachetomcat9


