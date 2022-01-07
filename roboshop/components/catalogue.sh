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

Print "copying content"
mv /home/roboshop/catalogue-main /home/roboshop/catalogue
stat $?

Print "need to install some dependencies"
cd /home/roboshop/catalogue
npm install --unsafe-perm &>>$LOG
stat $?

# we are giving SOME PERMISSIONS AS ROOT USER FOR INSTALLING DEPENDENCIES
Print "fixing app permissions"
chown -R roboshop:roboshop /home/roboshop
stat $?

Print "Update DNS records in systemD config"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service &>>$LOG
stat $?

# NOTE: We need to update the IP address of MONGODB Server in systemd.service file
# Now, lets set up the service with systemctl.
# need to make this machine to know the ip address of another machine

Print "copying the systemd file"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service &>>$LOG
stat $?

Print "system restarting"
systemctl daemon-reload &>>$LOG && systemctl start catalogue &>>$LOG && systemctl enable catalogue &>>$LOG
stat $?

Print "checking DB connection from app"
STAT=$(curl --s localhost:8080/health | jq .mongo)
echo status = $STAT
if ("$STAT" = "true"); then
  Stat 0
else
  Stat 1