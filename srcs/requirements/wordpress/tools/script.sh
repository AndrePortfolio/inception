#!/bin/bash

sleep 10

# Now that MariaDB is ready, continue with WordPress setup
wp core download --allow-root
wp config create --dbname="$SQL_DB" --dbuser="$SQL_USER" --dbpass="$SQL_PASS" --dbhost=mariadb --allow-root
wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL" --allow-root
wp user create "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASS" --role=author --allow-root

# Start PHP-FPM to serve WordPress
exec php-fpm7.4 -F
