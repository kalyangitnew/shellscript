#!/bin/bash
# there are three conditions
# 1.if statement 2.tf else statement 3. else if statement(multi-tier)
# to make decisions fro conditions we will write some "expressions"
# expressions are also three types
# 1. string comparison 2 . number comparison 3.file comparison.
# 1.string
# the operators are = , == , != , -z
read -p 'enter username: ' username

if [ "$username" == "root" ]; then
  echo "you are root user"
else
  echo "you are not root user"
fi

# above is string type and below is number type

if [ $UID -eq 0 ]; then
  echo "your are root  user"
else
  echo "you are not root user"
fi