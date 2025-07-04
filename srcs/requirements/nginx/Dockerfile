FROM debian:stable

RUN apt update -y && apt upgrade -y && \
    apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
openssl req -x509 -nodes \
-days 365 \
-keyout /etc/nginx/ssl/inception.key \
-out /etc/nginx/ssl/inception.crt \
-subj "/CN=${DOMAIN_NAME}"

RUN mkdir -p /var/www/wordpress /var/run/nginx && \
    chmod 755 /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress


COPY default /etc/nginx/sites-available/.


CMD nginx -g "daemon off;"