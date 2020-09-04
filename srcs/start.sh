#!/bin/bash

if [ "$AUTOINDEX" = "off" ] ;
then cp /tmp/server_auto_off.conf /etc/nginx/sites-available/default ;
else cp /tmp/server.conf /etc/nginx/sites-available/default ; fi

service php7.3-fpm start
#/etc/init.d/php7.3-fpm start
service mysql start
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
service nginx start