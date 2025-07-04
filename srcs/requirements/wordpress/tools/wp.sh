#!/bin/bash
set -e

apt update && apt upgrade -y
apt install -y curl lsb-release apt-transport-https ca-certificates gnupg

curl -sSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/php.gpg

echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

apt update
apt install -y php8.2 php8.2-fpm php8.2-mysql
apt clean && rm -rf /var/lib/apt/lists/*

exec php-fpm8.2 -F