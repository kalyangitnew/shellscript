#!/bin/bash

source components/common.sh
# this command used to load the same commands for all components(like steps defining)

Print "Installing nginx"
yum install nginx -y &>>$LOG
stat $?

Print "Enabling nginx"
systemctl enable nginx &>>$LOG
stat $?

Print "starting nginx"
systemctl start nginx &>>$LOG
stat $?

# Let's download the HTDOCS content and deploy under the Nginx path.
Print "downloading the needed html file"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>LOG
stat $?

# Deploy in Nginx Default Location.
# we will remove any html pages there before by gng to there and we will delete

Print "we went in to default html page and removed the old html content"
rm -rf /usr/share/nginx/html/* &>>$LOG
stat $?

Print "Extracting front end archieve"
unzip -o -d /tmp /tmp/frontend.zip &>>LOG
stat $?
# WE USING TO DO FORCEFULLLY WHEN MANY TIMES WE ARE DNG TO REPLACE AND COPY . WE WILL USE -o and -d as to do forcely in directory

Print "we are moving front end zip file to present location "
mv /tmp/frontend-main/static/* /usr/share/nginx/html/. &>>LOG
stat $?
# means we are moving the file there in to . and . means location of existing the prompt
# in static file it will be we will ake from there to copy in html page of nginx

Print "we are copying the roboshop conf file to nginx path"
cp /tmp/frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>LOG
stat $?
# Finally restart the service once to effect the changes.

Print "updating nginx conf file"
sed -i -e '/catalogue/ s/localhost/catalogue.roboshop.internal' -e '/cart/ s/localhost/cart.roboshop.internal' -e '/user/ s/localhost/user.roboshop.internal' -e '/payment/ s/localhost/payment.roboshop.internal' -e '/shipping/ s/shipping.roboshop.internal' /etc/nginx/default.d/roboshop.conf &>>$LOG
stat $?

Print "enabling nginx again"
systemctl enable nginx &>>$LOG
stat $?

Print "we are restarting nginx after modifications"
systemctl restart nginx &>>LOG
stat $?

# at starting we have used print function to show comments like starting,installing & enabling nginx
# in $1 all the time the line in print will be stored
# log command used to store all the data while we get installing nginx
# rm -f means just removing if we have any before and it also useful for running many times
# IMP ; we can avoid again restarting by just moving enabling and starting nginx to down and removing there ,its our wish
