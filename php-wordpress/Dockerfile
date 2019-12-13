FROM zeit/wait-for:0.2 as wait

FROM php:7-fpm-alpine
COPY --from=wait /bin/wait-for /bin/wait-for
RUN apk add --no-cache curl nginx bash
RUN curl -s --fail https://wordpress.org/latest.zip -o /var/www/latest.zip && \
  curl -s --fail https://downloads.wordpress.org/plugin/sqlite-integration.1.8.1.zip -o /var/www/sqlite-integration.zip && \
  cd /var/www && \
  unzip -q latest.zip && \
  unzip -q sqlite-integration.zip && \
  rm -rf *.zip && \
  mv sqlite-integration wordpress/wp-content/plugins && \
  cp wordpress/wp-content/plugins/sqlite-integration/db.php wordpress/wp-content/

COPY src/php-fpm.conf /usr/local/etc
COPY src/nginx.conf /etc/nginx
COPY src/run.sh .
COPY src/wp-config.php /var/www/wordpress/

# copy in the sqlite database
COPY data /data

CMD ["./run.sh"]
