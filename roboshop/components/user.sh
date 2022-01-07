#!/bin/bash

source components/common.sh

# This service is responsible for User Logins and Registrations Service in RobotShop e-commerce portal.

# This service is written in NodeJS, Hence need to install NodeJS in the system.

Print "Installing nodejs"
yum install nodejs make gcc-c++ -y &>>$LOG
stat $?

# Let's now set up the User application.

# As part of operating system standards, we run all the applications and databases as a normal user but not with root user.

# So to run the User service we choose to run as a normal user and that user name should be more relevant to the project. Hence we will use roboshop as the username to run the service.

Print "we need to add roboshop user"
id roboshop &>>$LOG
if [ $? -eq 0 ]; then
  echo "user already exists" &>>$LOG
else
  useradd roboshop &>>$LOG
fi
stat $?

# So let's switch to the roboshop user and run the following commands.

Print "downloading the archiev-zip file"
curl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip" &>>$LOG
stat $?

Print "Removing any old content"
rm -rf /home/roboshop/user &>>$LOG
stat $?


Print "Unzipping the file"
unzip -o -d /home/roboshop /tmp/user.zip &>>$LOG
stat $?

Print "copying to user file"
mv /home/roboshop/user-main /home/roboshop/user &>>$LOG
stat $?

Print "installing dependencies"
cd /home/roboshop/user
npm install --unsafe-perm &>>$LOG
stat $?

# Now, lets set up the service with systemctl.

Print "update DNS records"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e 's/'
# mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
# systemctl daemon-reload
# systemctl start user
# systemctl enable user