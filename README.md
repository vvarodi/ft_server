# ft_server

## Guide

### Step 1: Nginx installed to serve your content.
![Succesfully-installed-nginx](img/nginx.png)
 ```
 /etc/nginx/sites-available/* Extra virtual host configuration files
 /etc/nginx/sites-enabled/* Symlink to sites-available/<file> to enable vhost
 ```
![SimpleHello](img/indexhtml.png)

### Step 2: Installed PHP for Processing && Configuring Nginx to Use the PHP Processor
![php-info](img/php-info.png)
![php-working](img/php.png)
### Step 3: MySQL installed to store and manage your data. 
MariaDB (database system) installed to store and manage data for your site, some Linux distributions (including Debian) use MariaDB as a drop-in replacement for MySQL
[Installation](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10#step-2-%E2%80%94-installing-mariadb) --> [code](img/mariadb.png)
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
### Step 4: phpMyAdmin installed to handle the administration of MySQL over the Web.
![phpMyAdmin](img/phpMyAdminIndex.png)

Checking connection between MySQL and phpMyAdmin: Testing Database Connection from PHP [code](img/display_db_table.php)

![phpMyAdmin1](img/connectionMySQLphpMyAdmin.png)

![phpMyAdmin2](img/connectionMySQLphpMyAdmin2.png)

### Step 5: WordPress
![WordPressWelcome](img/wordpress_welcome.png)

![WordPressBlog](img/wordpress_blog.png)

Checking connection between MySQL/phpMyAdmin with WordPress: wordpress database

![WordPressDataBase](img/wordpress_database.png)
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
  * [wget](https://www.gnu.org/software/wget/) use it to retrieve content and files from various web servers
* **Nginx**
  * [Default nginx configuration](img/default)
  * [Nginx 502 Bad Gateway Error](https://ibcomputing.com/nginx-502-bad-gateway-error/)
  * [Autoindex-error](https://serverfault.com/questions/940276/force-nginx-to-always-autoindex-and-ignore-index-html-files)
  * [autoindex off error 403](https://stackoverflow.com/questions/10663248/how-to-configure-nginx-to-enable-kinda-file-browser-mode)
* **mariadb** (database system) installed to store and manage data for your site
  * [mysql_secure_installation](https://mariadb.com/kb/en/mysql_secure_installation/) a shell script available on Unix systems, and enables you to improve the security of your MariaDB installation
* **phpMyAdmin** phpMyAdmin is a free software tool written in PHP, intended to handle the administration of MySQL over the Web.
  * [phpMyAdmin Documentation](https://docs.phpmyadmin.net/en/latest/)
  * [phpMyAdmin Configuration](https://docs.phpmyadmin.net/en/latest/config.html#)
* **WordPress**
  * [wp-config.php](https://wordpress.org/support/article/editing-wp-config-php/)
  * [How to install](https://wordpress.org/support/article/how-to-install-wordpress/)