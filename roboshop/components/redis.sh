#!/bin/bash

source components/common.sh

# Install Redis.

Print "Install yum utils"
yum install epel-release yum-utils -y &>>$LOG
stat $?

Print "INSTALLING REDIS REPO"
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
stat $?

Print "enabling remi"
yum-config-manager --enable remi &>>$LOG
stat $?

Print "installing redis"
yum install redis -y &>>$LOG
stat $?

# Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf & /etc/redis/redis.conf

Print "Update DNS records in REDIS conf"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf &>>$LOG
stat $?

Print "starting redis database"
systemctl enable redis &>>$LOG
systemctl start rediS &>>$LOG
stat $?

# systemctl enable redis
# systemctl start redis here
#