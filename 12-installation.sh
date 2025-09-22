#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Error:: please run the script with root priveleges"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing mysql is a failure"
    exit 1
else
    echo "Installing mysql is a success"
fi