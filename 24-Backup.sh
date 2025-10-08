#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3: -14}
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." f1 )
#LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME.log
LOG_FILE="$LOGS_FOLDER/backup.log" # modified to run the script as command

mkdir -p $LOGS_FOLDER
echo "scriprt started execution at: $date " | tee -a $LOG_FILE

if [ $USERID -ne 0 ] ; then
    echo "ERROR:: run the script with root privileges"
    exit 1 #failure is other than 0
fi

USAGE(){
    echo -e "$R Usage:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days] $N"
    exit 1
}

#To check SOURCE_DIR and DEST_DIR passed or not
if [ $# -lt 2 ]; then
    USAGE
fi

#Check Source directory exits or not
if [ ! -d $SOURCE_DIR ] ; then
    echo -e "$R Source $SOURCE_DIR does not exist $N"
    exit 1
fi

#Check Destination directory exists or not
if [ ! -d $DEST_DIR ] ; then
    echo -e "$R Destination $DEST_DIR doesn't exist $N"
fi

# Find the files #
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

    #Check if files exists or not
    if [ ! -z "${FILES}"] ; then
    #start archiving#
        echo "Files found: $FILES"
        TIMESTAMP=$(date +%F-%H-%M)
        ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
        echo "Zip file name: $ZIP_FILe_NAME"
        find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME" 

    #Check if archival success or not
    if [ -f $ZIP_FILE_NAME]
     then
        echo -e "Archieval ....$G success $N"
            while IFS= read -r filepath
                do
                    echo "Deleting files: $filepath"
                    rm -rf $filepath
                    echo "Deleted files: $filepath"
                done <<< $FILES
    else
        echo "Archeval --- $R failure $N"
        exit 1
    fi
else
    echo -e "No files found for archive...$Y SKIPPING $N"
fi



