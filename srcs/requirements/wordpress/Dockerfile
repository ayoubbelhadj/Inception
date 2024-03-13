FROM debian:bullseye

# Install PHP and required extensions for WordPress
RUN apt-get update && \
    apt-get install -y \
        php-fpm \
        php-mysql \
        wget

# Download and extract WordPress
RUN mkdir -p /var/www/html && \
    wget -qO- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip-components=1

# Copy custom PHP configuration file
# COPY php.ini /etc/php/7.4/fpm/conf.d/wordpress.ini

# Set up permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 9000 for php-fpm
EXPOSE 9000

# Start php-fpm
COPY ./tools/script.sh .

CMD ["bash", "script.sh"]