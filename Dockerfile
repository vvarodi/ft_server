# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvarodi <vvarodi@student.42madrid.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/27 22:17:54 by vvarodi           #+#    #+#              #
#    Updated: 2020/08/30 01:10:57 by vvarodi          ###   ########.fr        #
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



# NGINX
RUN     echo "daemon off;" >> /etc/nginx/nginx.conf
COPY	/srcs/server.conf /etc/nginx/sites-available/server.conf
RUN		ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/server.conf
RUN		rm -rf /etc/nginx/sites-enabled/default


# PHPMYADMIN
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.2-english.tar.gz
RUN mv phpMyAdmin-5.0.2-english/ /var/www/html/phpmyadmin
RUN rm -rf phpMyAdmin-5.0.2-english.tar.gz
COPY srcs/config.inc.php /var/www/html/phpmyadmin



# Giving nginx's user-group rights over page files
RUN	chown -R www-data:www-data /var/www/html/*

COPY srcs/start.sh .

EXPOSE 80 443

CMD bash start.sh