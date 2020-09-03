# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvarodi <vvarodi@student.42madrid.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/27 22:17:54 by vvarodi           #+#    #+#              #
#    Updated: 2020/09/03 20:18:20 by vvarodi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install the base image
# Select image from Dockerhub - Debian Buster https://hub.docker.com/_/debia
FROM debian:buster

ARG autoindex=on

# Update package list and Install services
# The -y flag is for auto "Yes"  
RUN apt-get update && apt-get install -y \
    nginx \
    mariadb-server \
    php-fpm \
    php-mysql \
    php-mbstring \
    wget \
    && rm -rf /var/lib/apt/lists/*

# NGINX
RUN     echo "daemon off;" >> /etc/nginx/nginx.conf
COPY	srcs/server.conf /tmp/
COPY    srcs/server_auto_off.conf /tmp/
RUN     if [ "$autoindex" = "off" ] ; \
        then cp /tmp/server_auto_off.conf /etc/nginx/sites-available/default ; \
        else cp /tmp/server.conf /etc/nginx/sites-available/default ; fi
#COPY       /srcs/server.conf /etc/nginx/sites-available/server.conf
#RUN		ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/server.conf
#RUN		rm -rf /etc/nginx/sites-enabled/default

# PHPMYADMIN
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz && \
    tar -xzvf phpMyAdmin-5.0.2-english.tar.gz && \
    mv phpMyAdmin-5.0.2-english/ /var/www/html/phpmyadmin && \
    rm -rf phpMyAdmin-5.0.2-english.tar.gz
COPY srcs/config.inc.php /var/www/html/phpmyadmin

# WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    mv wordpress /var/www/html/ && \
    rm -rf latest.tar.gz
COPY srcs/wp-config.php /var/www/html/wordpress

# SLL SETUP
RUN mkdir ~/mkcert && cd ~/mkcert && \
	wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64 && \
	mv mkcert-v1.4.1-linux-amd64 mkcert && chmod +x mkcert &&\
	./mkcert -install && ./mkcert localhost

#DATABASE
COPY srcs/wordpress.sql ./root/
RUN service mysql start && \
echo "CREATE DATABASE wordpress;" | mysql -u root && \
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root && \
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root  && \
mysql wordpress -u root --password=  < ./root/wordpress.sql 

# Giving nginx's user-group rights over page files
RUN	chown -R www-data:www-data /var/www/html/*

COPY srcs/start.sh .
COPY srcs/main.php /var/www/html/
COPY srcs/index.html /var/www/html/

# Ports that needs to be exposed at run time with -p [host port]:[container port]
EXPOSE 80 443

CMD bash start.sh
