#!/bin/bash

service mysql start

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DB;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $SQL_DB.* TO '$SQL_USER'@'%' WITH GRANT OPTION;"
ALTER USER 'root@localhost' IDENTIFIED BY $SQL_ROOT_PASS;
mysql -u root -e "FLUSH PRIVILEGES;"

mysqld --bind-address=0.0.0.0








