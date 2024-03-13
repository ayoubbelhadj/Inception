#!/bin/bash

# Start MariaDB service
service mariadb start


# Create a new database and user
mariadb <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

# Stop MariaDB service
service mariadb stop

# Start MariaDB in the foreground to keep the container running
mysqld_safe --bind 0.0.0.0 --port 3306
