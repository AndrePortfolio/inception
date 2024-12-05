#!/bin/bash

wp core download --allow-root
wp config create --dbname=$SQL_DB --dbuser=$SQL_USER --dbpass=$SQL_PASS --dbhost=mariadb --allow-root
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS --role=author --allow-root

php-fpm7.4 -F