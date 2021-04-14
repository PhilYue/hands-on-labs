#!/bin/bash
echo "start init mysql server"
echo "downloading mysql server ......"

mkdir /home/shell/log

wget https://handson.oss-cn-shanghai.aliyuncs.com/mysql-5.6.30-linux-glibc2.5-x86_64.tar.gz -O .mysql-5.6.30-linux-glibc2.5-x86_64.tar.gz

tar -xzvf .mysql-5.6.30-linux-glibc2.5-x86_64.tar.gz

mv mysql-5.6.30-linux-glibc2.5-x86_64 .mysql
mv mysql/mysqld.cnf .mysql/mysqld.cnf

cd .mysql

echo "installing mysql server ......"

#./scripts/mysql_install_db --basedir=/home/shell/.mysql --datadir=/home/shell/data/ --socket=/home/shell/data/mysql.sock --bind-address=0.0.0.0
./scripts/mysql_install_db --basedir=/home/shell/.mysql

echo "starting mysql server ......"

./bin/mysqld_safe --defaults-file=/home/shell/.mysql/mysqld.cnf &

sleep 5

mysqladmin --defaults-file=/home/shell/.mysql/mysqld.cnf -uroot create seata

mysql --defaults-file=/home/shell/.mysql/mysqld.cnf -uroot < /home/shell/mysql/seata.sql

echo "init mysql server done"