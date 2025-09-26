#!/bin/bash

set -e

error(){
    echo "there is an error"
}

trap err ERR
echo "Hello.."
echo "Before Error"
shsjdnk;#here shell understands there is qn error
echo "after error"