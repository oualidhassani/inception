#! /bin/bash

mkdir -p /var/www/wordpress
cd /var/www/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '${MYSQL_DATABASE}' );/" wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '${MYSQL_USER}' );/" wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '${MYSQL_PASSWORD}' );/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php



wp core install \
  --url="${DOMAIN_NAME}" \
  --title="${SITE_TITLE}" \
  --admin_user="${WP_ADMIN_USER}" \
  --admin_password="${WP_ADMIN_PASSWORD}" \
  --admin_email="${WP_ADMIN_EMAIL}" \
  --allow-root


wp user create \
    "${WP_USER}" "${WP_USER_EMAIL}" \
    --user_pass="${WP_USER_PASSWORD}" \
    --role=editor \
    --allow-root

mkdir -p /run/php


exec php-fpm8.2 -F