#!/bin/bash

echo "all the variables which are passed to the script are: $*"
echo "The number of arguments passed to the script are: $#"
echo "The name of the script is: $0"
echo "The process ID of the current script is: $$"
echo "The exit status of the last command executed is: $?"
echo "The first argument passed to the script is: $1"
echo "the last argument passed to the script is: ${!#}"
echo "user running the script is: $USER"
echo "home directory of the user is: $HOME"
echo "current working directory is: $PWD"
echo "shell being used is: $SHELL"