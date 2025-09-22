#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Error:: please run the script with root priveleges"
    exit 1
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo -e "Installing $2 ...$R failure $N"
        exit 1
    else
       echo -e "Installing $2 ...$G success $N"
    fi
}


dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "Mysql already exist...$Y skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "nginx already exist...$Y skipping $N"
fi


dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "python3 already exist...$Y skipping $N"
fi