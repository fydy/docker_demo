FROM library/centos:7.5.1804
ARG PHALCON_VERSION=3.4.5
RUN yum -y install wget git gcc make file
RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
# RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/latest.rpm
RUN yum -y install \
  php72w-cli php72w-fpm php72w-mbstring php72w-mysql php72w-opcache \
  php72w-gd php72w-xml \
  mod_php72w php72w-common \
  php72w-imap php72w-interbase \
  php72w-odbc php72w-pdo php72w-pdo_dblib \
  php72w-pear php72w-pecl-apcu php72w-pecl-imagick php72w-pecl-mongodb php72w-pgsql \
  php72w-recode php72w-snmp php72w-soap php72w-sodium php72w-tidy php72w-xml php72w-xmlrpc
# RUN yum -y install epel-release
RUN yum -y install patchelf

# RUN wget https://github.com/phalcon/cphalcon/archive/v$PHALCON_VERSION.tar.gz && tar zxf v$PHALCON_VERSION.tar.gz
# RUN cd cphalcon-$PHALCON_VERSION/build && /usr/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && ./install

RUN mkdir -p /root/app/public
RUN mkdir -p /root/app/native

WORKDIR /root/app

COPY ./php.ini /root/app/native/php.ini
COPY ./php-fpm.ini /root/app/native/php-fpm.ini
COPY ./test.php /root/app/test.php
COPY ./test.sh /root/app/test.sh

CMD ["/bin/bash", "test.sh"]
