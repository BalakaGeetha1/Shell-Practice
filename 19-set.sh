#!/bin/bash

set -e

# error(){
#     echo "there is an error"
# }

trap 'echo "There is an error in $LINENO, Command is: $BASH_COMMAND"' ERR

echo "Hello.."
echo "Before Error"
shsjdnk;gh #here shell understands there is qn error
echo "after error"