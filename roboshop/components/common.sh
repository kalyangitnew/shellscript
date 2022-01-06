#!/bin/bash
# The frontend is the service in RobotShop to serve the web content over Nginx.
Print () {
  echo -n -e "\e[1m$1\e[0m ..... "
  echo -e "\n\e[36m------------ $1 -----------\n\e[0m" >>$LOG
}
stat () {
  if [ $1 -eq 0 ]; then
    echo -e "\e[1;32mSUCCESS\e[0m"
  else
    echo -e "\e[1;31mFAILURE\e[0m"
    echo -e "\n\e[1;33m script fail check logs\e[0m"
    exit 1
  fi
}
# we have defined new function called stat to print success of installation after the command of yum success exit will mark 0 in "$?"
# so we mentioned stat "$?" in the bottom of install command(means after print
# \n & -n is just to make install message and success message in one line and 1: is to thick colour

LOG=/tmp/roboshop.log
rm -f $LOG

# this is the common file for every component we will pull this fill by command "source in every component"