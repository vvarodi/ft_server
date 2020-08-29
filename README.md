# ft_server

## Guide

### Step 1: **Nginx** installed to serve your content.
![Succesfully-installed-nginx](img/nginx.png)
### Step 2: Installed **PHP** for Processing && Configuring Nginx to Use the PHP Processor
![php-info](img/php-info.png)
![php-working](img/php.png)
### Step 3: **MySQL** installed to store and manage your data. 

[Installation](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10#step-2-%E2%80%94-installing-mariadb)
```
mariadb
MariaDB i(none)|> CREATE DATABASE example_databse;
MariaDB i(none)|> GRANT ALL PRIVILEGES ON example_database.* TO 'example_user'¾'localhost';
MariaDB i(none)|> FLUSH PRIVILEGES;
MariaDB i(none)|> exit
mariadb -u root -p
>Enter password: 
MariaDB i(none)|> SHOW DATABASES;
```
```
+--------------------+
f Database           f
+--------------------+
f information_schema f
f mysql              f
f example_database   f
f performance_schema f
+--------------------+
4 rows in set (0.000 sec)
```

## Handle errors:

If your page is not loading or throwing an error. Inspect:
``` 
cat /var/log/nginx/access.log
cat /var/log/nginx/error.log
```
To see all running services:

```
service --status-all 
```

![services](img/services.png)

## Resources:
* **Docker**
  * [Get started with Docker](https://docs.docker.com/get-started/)
  * [Docker curriculum](https://docker-curriculum.com/)
  * [The Docker Handbook](https://www.freecodecamp.org/news/the-docker-handbook/)
* **Dockerfile:** a text file that contains all commands, in order, needed to build a given image.
  * [Dockerfile-best-practice](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
  * [Dockerfile-reference](https://docs.docker.com/engine/reference/builder/)
* **Web Server:** a web server stores and delivers the content for a website – such as text, images, video, and application data – to clients that request it.
  * [How To Install Linux, Nginx, MariaDB, PHP (LEMP stack) on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10)
   LEMP stack means: Linux, Nginx, MySQL, PHP.
* **Debian**
  * [About Debian](https://www.debian.org/intro/about)
  * [Debian Directory Structure](https://wiki.debian.org/Nginx/DirectoryStructure)
* **Nginx**
  * [Default nginx configuration](img/default)
  * [Nginx 502 Bad Gateway Error](https://ibcomputing.com/nginx-502-bad-gateway-error/)
  * [Autoindex-error](https://serverfault.com/questions/940276/force-nginx-to-always-autoindex-and-ignore-index-html-files)