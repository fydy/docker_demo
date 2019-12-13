#!/bin/bash
php-fpm --allow-to-run-as-root &
wait-for /tmp/php5-fpm.sock
echo "php-fpm started"
nginx &
wait -n
pkill -P $$
