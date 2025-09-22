#!/bin/bash

Number=$1
if [ $Number -lt 10 ]; then
    echo " Given number $Number is lessthan 10"
else
    echo "Given number $Number is greater than or equal to 10"
fi