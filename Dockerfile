# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvarodi <vvarodi@student.42madrid.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/27 22:17:54 by vvarodi           #+#    #+#              #
#    Updated: 2020/08/29 17:29:30 by vvarodi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install the base image
# Select image from Dockerhub - Debian Buster https://hub.docker.com/_/debia
FROM debian:buster


# Update package list and Install services
# The -y flag is for auto "Yes"  
RUN apt-get update && apt-get install -y \
    nginx \
    mariadb-server \
    php-fpm \
    php-mysql \
    php-mbstring \
    openssl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# MariaDB (database system) installed to store and manage data for your site
# some Linux distributions (including Debian) use MariaDB as a drop-in replacement for MySQL

# Install PHP to process code and generate dynamic content for the web server


RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# ./sites-available/* Extra virtual host configuration files
# ./sites-enabled/* Symlink to sites-available/<file> to enable vhost

#Copying nginx confs
COPY	/srcs/server.conf /etc/nginx/sites-available/server.conf
RUN		ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/server.conf

#Removing deault server
RUN		rm -rf /etc/nginx/sites-enabled/default
#
# In most cases, administrators will remove this file from sites-enabled/ and
# leave it as reference inside of sites-available where it will continue to be
# updated by the nginx packaging team.
#

# Giving nginx's user-group rights over page files
RUN	chown -R www-data:www-data /var/www/html/*
COPY srcs/index.html /var/www/html/
COPY srcs/index.php /var/www/html/

COPY srcs/start.sh .

EXPOSE 80 443

CMD bash start.sh

# http://localhost:8080