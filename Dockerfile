# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvarodi <vvarodi@student.42madrid.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/27 22:17:54 by vvarodi           #+#    #+#              #
#    Updated: 2020/08/27 22:56:50 by vvarodi          ###   ########.fr        #
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
EXPOSE 80 

# Two ways of making it work, or adding daemon off to ngnix config file or CMD below
# CMD ["nginx", "-g", "daemon off;"] 

CMD nginx

# http://localhost:8080