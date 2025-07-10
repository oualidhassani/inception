FROM debian:stable

RUN apt update && apt upgrade -y && \
    apt install -y curl lsb-release apt-transport-https ca-certificates gnupg && \
    curl -sSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/php.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt update && \
    apt install -y php8.2 php8.2-fpm php8.2-mysql && \
    apt clean && rm -rf /var/lib/apt/lists/*

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/wordpress.sh /usr/local/bin/wordpress.sh
RUN chmod +x /usr/local/bin/wordpress.sh

# CMD ["php-fpm8.2", "-F"]
CMD ["/usr/local/bin/wordpress.sh"]