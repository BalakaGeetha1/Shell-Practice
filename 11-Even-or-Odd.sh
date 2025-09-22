#!/bin/bash

echo " enter a number:"
read Number

if [ $Number % 2 -eq 0 ];then
    echo "Given Number $Number is even"
else
    echo "Given Number $Number is odd"
fi