#!/bin/bash
count=5
echo "starting countdown"

while [ $count -gt 0 ]
do
    echo "time left: $count"
    sleep 1
    count=$((count-1))
    echo "hi time is going fast please finish the exam"
done
echo "Time Up!"