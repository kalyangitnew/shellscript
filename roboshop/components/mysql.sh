#!/bin/bash

source components/common.sh

MSPACE=$(cat $0 components/common.sh | grep Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)


COMPONENT_NAME=MySQL
COMPONENT=mysql

Print "Setup MySQL Repo"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo &>>$LOG
Stat $?

Print "Install MariaDB Service"
yum remove mariadb-libs -y &>>$LOG  && yum install mysql-community-server -y &>>$LOG
Stat $?

Print "Start MySQL Service"
systemctl enable mysqld &>>$LOG && systemctl start mysqld &>>$LOG
Stat $?

DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
NEW_PASSWORD="RoboShop@1"

# here show databases is the mysql command to see databases inthe server
echo 'show databases;' | mysql -uroot -p"${NEW_PASSWORD}"  &>>$LOG
# we will get results as not changes so we will go to conditions statment
# as the stament is known for changing the password in mysql and uninstall the pluggin is for the the properties of password to entry or ask when creation in mysql
if [ $? -ne 0 ]; then
  Print "Changing the Default Password"
  echo -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${NEW_PASSWORD}';\nuninstall plugin validate_password;" >/tmp/pass.sql
  mysql --connect-expired-password -uroot -p"${DEFAULT_PASSWORD}" </tmp/pass.sql &>>$LOG
  Stat $?
fi

DOWNLOAD "/tmp"

Print "Load Schema"
cd /tmp/mysql-main
mysql -u root -pRoboShop@1 <shipping.sql &>>$LOG
Stat $?