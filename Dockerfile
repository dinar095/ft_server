FROM debian:buster
RUN apt update && apt -y upgrade
RUN apt install -y wget && apt install -y mariadb-server && apt install -y nginx && apt install -y php && apt install -y vim  && apt install -y php-fpm
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar -C "/var/www/html" -xvzf phpMyAdmin-5.1.0-english.tar.gz
RUN mv /var/www/html/phpMyAdmin-5.1.0-english/ /var/www/html/phpmyadmin
WORKDIR
