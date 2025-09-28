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
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME.log

mkdir -p $LOGS_FOLDER
echo "scriprt started execution at : $date " | tee -a $LOG_FILE

if [ $USERID -ne 0 ] ; then
    echo " run the script with root privileges"
    exit 1
fi

USAGE(){
    echo -e "$R Usage:: sudo sh 24-backup.sh <source-dir><dest_dir><days>[optional, default 14 days] $N"
    exit 1
}

#To check the arguments
if [ $# -lt 2 ]; then
    USAGE
fi

#Check Source directory exits or not
if [ ! -d $SOURCE_DIR ] ; then
    echo -e "$R $SOURCE_DIR does not exist $N"
    exit 1
fi

#Check Destination directory exists or not
if [ ! -d $DEST_DIR ] ; then
    echo -e "$R Destination Directory doesn't exist $N"
fi

FILES=$( find $SOURCE_DIR -type f -mtime +14 -size +10M )

    #Check if files exists or not
    if [ ! -z $FILES ] ; then
        echo "Files found: $FILES "
        TIME_STAMP=$(date +%F-%H-%M)
        ZIP_FILE_NAME="$DEST_DIR/$app_logs-$TIME_STAMP.zip"
        echo "Zip file name: $ZIP_FILe_NAME"
        find $SOURCE_DIR -name *.log -type f -mtime +14 | zip -@ -j "$ZIP_FILE_NAME" 

    #Check if archival success or not
    if [ -f $ZIP_FILE_NAME]; then
        echo -e "$G Archieval success $N"
        whil IFS=    read -r filepath
            do
                echo "Deleting files: $filepath"
                rm -rf $filepath
                echo "Deleted files: $filepath"
            done <<< $FILES
    else
        echo "$R Archeval failure $N"
    fi
else
    echo " no files found for archive"
fi



