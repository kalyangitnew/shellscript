#!/bin/bash
source components/common.sh

# Print "DOWNLOADING REPOS"
# curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo
# stat $?

# Print "Installing mongo db"
# yum install -y mongodb-org &>>$LOG
# stat $?

# Print "mongod is enabled"
# systemctl enable mongod &>>$LOG
# stat $?

# Print "mongod is started"
# systemctl start mongod &>>$LOG
# stat $?

# Update Liste IP address from 127.0.0.1 to 0.0.0.0 in config file
# /etc/mongod.conf
# we have using sed editor

# Print "updating mongod config file"
# sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>>$LOG
# stat $?

# restarting system again

# Print "restarted after changing DNS"
# systemctl restart mongod &>>$LOG
# stat $?

# Download the schema and load it.

# Print "Download the schema file"
# curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG
# stat $?


# Print "unzip the schema"
# unzip -o -d /tmp /tmp/mongodb.zip &>>$LOG
# stat $?

# Print "loading schema"
#cd /tmp/mongodb-main
# mongo < catalogue.js &>>$LOG
# mongo < users.js &>>$LOG
# stat $?
# done

MSPACE=$(cat $0 | grep Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)

COMPONENT_NAME=MongoDB
COMPONENT=mongodb

Print "Download Repo"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG
Stat $?

Print "Install MongoDB"
yum install -y mongodb-org &>>$LOG
Stat $?

Print "Update MongoDB Config"
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>>$LOG
Stat $?

Print "Start MongoDB"
systemctl restart mongod &>>$LOG
Stat $?

Print "Enable MongoDB Service"
systemctl enable mongod &>>$LOG
Stat $?

DOWNLOAD "/tmp"

Print "Load Schema"
cd /tmp/mongodb-main
for db in catalogue users ; do
  mongo < $db.js &>>$LOG
done
Stat $?