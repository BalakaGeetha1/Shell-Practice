#!/bin/bash

echo " All variables passed to the script: $@"
echo "All variables passed to the script: $*"

echo "Current diraectory: $pwd"
echo "who is running this: $USER"
echo "Home directory of user: $HOME"
echo "Pid of the script is: $$"
sleep 50 &
echo "PID of the last command in script is : $!"