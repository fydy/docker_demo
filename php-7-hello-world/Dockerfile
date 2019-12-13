FROM zeit/wait-for:0.2 as wait

FROM alpine:edge
RUN apk add --no-cache nginx php7-fpm bash
SHELL ["/bin/bash", "-c"]
COPY --from=wait /bin/wait-for /bin/wait-for
WORKDIR /www
COPY nginx.conf /etc/nginx/
COPY www.conf /etc/php7/php-fpm.d/
COPY *.php ./
CMD php-fpm7 -F & (wait-for /tmp/php7-fpm.sock && nginx) & wait -n
