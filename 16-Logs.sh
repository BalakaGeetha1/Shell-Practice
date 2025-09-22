#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Logs_Folder="/var/log/shell-script"
Script_Name=$( echo $0 | cut -d "." -f1 )
mkdir -p $Logs_Folder
Log_File="$Logs_Folder/$Script_Name.log"


echo "Script started excuting at : $(date)" | tee -a $Log_File
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Error:: please run the script with root priveleges"
    exit 1 #failure is other than 0
fi

VALIDATE(){  #functions recive input through args just like the shell script args
    if [ $? -ne 0 ]; then
        echo -e "Installing $2 ...$R failure $N"  | tee -a $Log_File
        exit 1
    else
       echo -e "Installing $2 ...$G success $N"  | tee -a $Log_File
    fi
}


dnf list installed mysql &>>$Log_File
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$Log_File
    VALIDATE $? "MYSQL"
else
    echo -e "Mysql already exist...$Y skipping $N" | tee -a $Log_File
fi

dnf list installed nginx &>>$Log_File
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$Log_File
    VALIDATE $? "Nginx"
else
    echo -e "nginx already exist...$Y skipping $N" | tee -a $Log_File
fi


dnf list installed python3 &>>$Log_File
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$Log_File
    VALIDATE $? "python3"
else
    echo -e "python3 already exist...$Y skipping $N" | tee -a $Log_File
fi