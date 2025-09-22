#!/bin/bash

echo " enter a number:"
read Number

#if (( $Number % 2 == 0 )); then
if [ $Number % 2 -eq 0 ]; then
    echo "$Number is Even"
else
    echo "$Number is Odd"
fi