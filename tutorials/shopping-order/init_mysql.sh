#!/bin/bash
echo "start init mysql server"
echo "downloading mysql server ......"

mkdir /home/shell/log

wget https://handson.oss-cn-shanghai.aliyuncs.com/mysql-5.6.30-linux-glibc2.5-x86_64.tar.gz -O .mysql-5.6.30-linux-glibc2.5-x86_64.tar.gz

tar -xzvf .mysql-5.6.30-linux-glibc2.5-x86_64.tar.gz

mv mysql-5.6.30-linux-glibc2.5-x86_64 .mysql

cd .mysql

echo "installing mysql server ......"

./scripts/mysql_install_db --basedir /home/shell/.mysql --socket=/tmp/mysql.sock

echo "starting mysql server ......"

./bin/mysqld_safe&

sleep 5

mysqladmin -uroot create seata

mysql -uroot < /home/shell/seata.sql

echo "init mysql server done"