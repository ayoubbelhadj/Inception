#wp conf
sleep 5

wp config set SERVER_PORT 3306 --allow-root
wp config set DB_NAME $DB_NAME --allow-root --path=/var/www/html
wp config set DB_USER $DB_USER --allow-root --path=/var/www/html
wp config set DB_PASSWORD $DB_PASS --allow-root --path=/var/www/html
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html

wp core install --url=$DOMAIN_NAME --title=inception \
    --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPASS \
    --admin_email=$WP_ADMINEMAIL --allow-root --path=/var/www/html
wp user create $WP_USER $WP_USEREMAIL --role=author --user_pass=$WP_USERPASS \
     --allow-root --path=/var/www/html

php-fpm7.4 -F