FROM debian:stable

COPY tools/wp.sh /usr/local/bin/wp.sh

RUN chmod +x /usr/local/bin/wp.sh

COPY www.conf /etc/php/8.2/fpm/pool.d/.

CMD ["/usr/local/bin/wp.sh"]

# CMD ["php-fpm8.2", "-F"]