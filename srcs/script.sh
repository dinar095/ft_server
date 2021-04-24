#!/bin/bash

service nginx       start
service mysql       start
service php7.3-fpm  start
mysql -e "CREATE DATABASE wordpress;"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"
mysql -e "update mysql.user set plugin='' where user='root';"

bash