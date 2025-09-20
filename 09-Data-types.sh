#!/bin/bash

#Everything in shell is considered as string 
NUMBER1=100
NUMBER2=200

SUM=$(($NUMBER1+$NUMBER2))

echo $SUM

NAME=DEVOPS
SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo $SUM

LEADERS=("Modi" "Putin" "Trump")
echo "All Leaders: ${LEADERS[@]}"
echo "leader at index o is ${LEADERS[0]}"