#!/bin/bash

/*I'm going to write an example for if-else conditionals in bash */

number=$1

if [ $number -lt 10 ]; then
    echo "The number is less than 10"
elif [ $number -eq 10 ]; then
    echo "The number is equal to 10"
else
    echo "The number is greater than 10"
fi