#!/bin/bash

source components/common.sh
# this command used to load the same commands for all components(like steps defining)

Print "Installing nginx"
yum install nginx -y &>>$LOG
stat $?

Print "Enabling nginx"
systemctl enable nginx &>>LOG
stat $?

Print "starting nginx"
systemctl start nginx &>>LOG
stat $?

# Let's download the HTDOCS content and deploy under the Nginx path.
Print "downloading the needed html file"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>LOG
stat $?

# Deploy in Nginx Default Location.
# we will remove any html pages there before by gng to there and we will delete

Print "we went in to default html page and removed the old html content"
cd /usr/share/nginx/html
rm -rf *
stat $?

exit

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
