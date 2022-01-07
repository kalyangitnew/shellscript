#!/bin/bash
source components/common.sh

# This service is responsible for showing the list of items that are to be sold by the RobotShop e-commerce porta
# This service is written in NodeJS, Hence need to install NodeJS in the system.

Print "Installing nodejs"
yum install nodejs make gcc-c++ -y &>>$LOG
stat $?
# Let's now set up the catalogue application.

# As part of operating system standards, we run all the applications and databases as a normal user but not with root user.

# So to run the catalogue service we choose to run as a normal user and that user name should be more relevant to the project. Hence we will use roboshop as the username to run the service.
# we need to check user is there or not if we do many times it may face issue
Print "we need to add roboshop user"
id roboshop &>>$LOG
if [ $? -eq 0 ]; then
  echo "user already exists" &>>$LOG
else
  useradd roboshop &>>$LOG
fi
stat $?

# So let's switch to the roboshop user and run the following commands.

Print "Downloading the main file for catalogue"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
stat $?

Print "Removing any old content"
rm -rf /home/roboshop/catalogue
stat $?

Print "unzipping the catalogue file"
unzip -o -d /home/roboshop /tmp/catalogue.zip &>>$LOG
stat $?

Print "copying the content"
mv /home/roboshop/catalogue-main /home/roboshop/
 cd /home/roboshop/catalogue
$ npm install
NOTE: We need to update the IP address of MONGODB Server in systemd.service file
Now, lets set up the service with systemctl.

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue