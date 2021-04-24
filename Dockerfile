FROM debian:buster
RUN apt update && apt -y upgrade
RUN apt install -y wget mariadb-server nginx php vim  php-fpm php-xml php-mysql
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar -C "/var/www/html" -xvzf phpMyAdmin-5.1.0-english.tar.gz && rm phpMyAdmin-5.1.0-english.tar.gz
RUN mv /var/www/html/phpMyAdmin-5.1.0-english/ /var/www/html/phpmyadmin
COPY srcs/nginx.conf /etc/nginx/sites-available/
COPY srcs/script.sh /
COPY srcs/config.inc.php /var/www/html/phpmyadmin/
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Kazan/O=School21/OU=21School/CN=myssl" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/nginx.conf  /etc/nginx/sites-enabled/nginx.conf
RUN chmod +x script.sh
CMD ./script.sh

