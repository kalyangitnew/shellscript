#!/bin/bash

source components/common.sh
# this command used to load the same commands for all components(like steps defining)

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
