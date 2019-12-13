# Build deps
FROM composer:latest as vendor

COPY database/ database/
COPY composer.json composer.json
COPY composer.lock composer.lock

RUN composer install --ignore-platform-reqs --no-interaction \
    --no-plugins --no-scripts --prefer-dist --no-dev

FROM zeit/wait-for:0.2 as wait

FROM php:7-fpm-alpine
COPY --from=wait /bin/wait-for /bin/wait-for
COPY --from=vendor /app/vendor /var/www/laravel/vendor
RUN apk add --no-cache nginx curl bash

# Ensure we only have one www.conf
RUN rm -rf /usr/local/etc/php-fpm.d/
RUN mkdir /usr/local/etc/php-fpm.d/
COPY docker/www.conf /usr/local/etc/php-fpm.d/
COPY docker/php.ini /usr/local/etc/php/
COPY docker/nginx.conf /etc/nginx/

WORKDIR /var/www/laravel
COPY . .
RUN mkdir -p bootstrap/cache storage/app storage/framework/cache storage/framework/sessions storage/framework/views storage/logs
RUN php artisan route:cache
RUN chown -R nobody:nobody /var/www/laravel

CMD ["/bin/bash", "-c", "php /var/www/laravel/artisan config:cache && php-fpm -F & (wait-for /tmp/php7-fpm.sock && nginx) & wait -n"]
