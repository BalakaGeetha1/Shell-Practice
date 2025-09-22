#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Error:: please run the script with root priveleges"
    exit 1
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo "ERROR:: Installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is success"
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "mongodb-mongosh"
