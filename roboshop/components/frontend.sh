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
  fi
}
# we have defined new function called stat to print success of installation after the command of yum success exit will mark 0 in "$?"
# so we mentioned stat "$?" in the bottom of install command(means after print
# \n & -n is just to make install message and success message in one line and 1: is to thick colour

LOG=/tmp/roboshop.log
rm -f $LOG

Print "Installing nginx"
yum install nginx -y &>>$LOG
stat $?

Print "Enabling nginx"
systemctl enable nginx
stat $?

Print "starting nginx"
systemctl start nginx
stat $?

exit
# Let's download the HTDOCS content and deploy under the Nginx path.

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

# Deploy in Nginx Default Location.

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master static README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
# Finally restart the service once to effect the changes.

systemctl restart nginx

# at starting we have used print function to show comments like starting,installing & enabling nginx
# in $1 all the time the line in print will be stored
# log command used to store all the data while we get installing nginx
# rm -f means just removing if we have any before and it also useful for running many times
