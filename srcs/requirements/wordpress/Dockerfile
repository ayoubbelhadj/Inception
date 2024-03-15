FROM debian:bullseye

# Install PHP, required extensions for WordPress, and WP-CLI
RUN apt update
RUN apt install -y php
RUN apt install -y php-fpm
RUN apt install -y php-mysql
RUN apt install -y curl
RUN apt install -y sendmail 

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 9000#' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/script.sh .

EXPOSE 9000

CMD ["bash", "script.sh"]
