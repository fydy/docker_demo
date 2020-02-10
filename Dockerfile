FROM library/centos:6.8
ARG PHP_VERSION=73
ARG PHALCON_VERSION=4.0.3

RUN yum -y install wget git gcc make file libz-dev
RUN yum install -y yum-utils epel-release which
RUN yum install -y zip unzip
RUN yum install -y libcrypt*
RUN yum install -y zlib.i686

# RUN yum install -y dnf
# RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# RUN wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm
# RUN rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
# RUN wget http://rpms.remirepo.net/enterprise/8/remi/x86_64//php74-php-phalcon4-4.0.0~rc.3-1.el8.remi.x86_64.rpm
# RUN rpm -Uvh php74-php-phalcon4-4.0.0_rc.3-1.el8.remi.x86_64
# RUN yum -y install -y http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
# RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# RUN wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm
# RUN rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
# RUN dnf -y install dnf-utils
# RUN dnf module install php:remi-7.4 -y
RUN yum -y install -y http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN yum-config-manager --enable remi-php$PHP_VERSION
RUN yum --enablerepo=remi-safe -y install php php-cli php-fpm php-imap php-mysqli php-common php-apcu php-devel php-ds php-cgi php-pdo php-intl php-pgsql php-xmlrpc php-soap php-swoole php-sodium php-opcache php-pear php-bcmath php-dom php-simplexml php-ssh2 php-xml php-xmlreader php-curl php-date php-exif php-filter php-ftp php-gd php-hash php-iconv php-json php-libxml php-mbstring php-mysqlnd php-openssl php-pcre php-posix php-sockets php-spl php-tokenizer php-zlib
RUN pecl search zip
RUN yum install -y php-pecl-zip
RUN yum install -y php-pecl-mcrypt
# RUN yum install -y php-pecl-imagick
# RUN dnf --enablerepo=remi install -y php74-php-phalcon4
RUN yum install --enablerepo=remi --enablerepo=remi-php73 php-xml

RUN yum -y install patchelf gdb

RUN curl -L -O http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz && \
    tar zxf autoconf-2.69.tar.gz && \
    cd autoconf-2.69 && \
    yum install -y openssl-devel && \
    ./configure && make && make install

RUN yum --enablerepo=remi-safe -y install ImageMagick ImageMagick-devel
RUN pecl install imagick

# RUN yum install -y ImageMagick ImageMagick-devel gcc-c++ automake
# RUN pecl install imagick

# RUN yum remove libzip -y
#  wget https://nih.at/libzip/libzip-1.2.0.tar.gz && tar -zxvf libzip-1.2.0.tar.gz && cd libzip-1.2.0 && ./configure && make && make install
# RUN wget https://pecl.php.net/get/zip-1.15.5.tgz && tar -zxvf zip-1.15.5.tgz && cd zip-1.15.5 && /usr/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && ln -s /usr/local/lib/libzip/include/zipconf.h /usr/local/include/zipconf.h && make && make install
RUN git clone https://github.com/jbboehr/php-psr.git && cd php-psr && /usr/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && make && make test && make install
RUN wget https://github.com/phalcon/cphalcon/archive/v$PHALCON_VERSION.tar.gz && tar zxf v$PHALCON_VERSION.tar.gz
RUN cd cphalcon-$PHALCON_VERSION/build && ./install
RUN wget https://pecl.php.net/get/redis && tar -zxvf redis && cd redis-* && /usr/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && make && make install
RUN wget https://github.com/websupport-sk/pecl-memcache/archive/4.0.5.2.zip && unzip 4.0.5.2.zip && cd pecl-memcache-4.0.5.2 && /usr/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && make && make install
RUN yum install -y libmemcached-devel
RUN wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz && tar -zxvf libmemcached-1.0.18.tar.gz && cd libmemcached-1.0.18 && ./configure --with-php-config=/usr/bin/php-config --disable-memcached-sasl && make && make install
RUN git clone https://github.com/php-memcached-dev/php-memcached.git && cd php-memcached && /usr/bin/phpize && ./configure --with-php-config=/usr/bin/php-config --disable-memcached-sasl && make && make install
RUN wget https://pecl.php.net/get/yaf && tar -xzvf yaf && cd yaf-* && /usr/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && make && make install

RUN php --ini
RUN ls -a /usr/lib64
RUN php -m

# RUN yum -y install libmemcached libmemcached-devel
# RUN wget https://pecl.php.net/get/memcached-3.1.5.tgz && tar -zxvf memcached-3.1.5.tgz && cd memcached-3.1.5 && /usr/bin/phpize && ./configure --with-php-config=/usr/bin/php-config --disable-memcached-sasl && make && make install
# RUN wget http://www.imagemagick.org/download/ImageMagick.tar.gz && tar -zxvf ImageMagick.tar.gz && cd ImageMagick-7.0.9-10 && ./configure --with-php-config=/usr/bin/php-config && make && make install
# RUN yum install -y gtk2-devel
# RUN wget https://pecl.php.net/get/imagick-3.4.4.tgz && tar -zxvf imagick-3.4.4.tgz && cd imagick-3.4.4 && /usr/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && make && make install
# RUN wget https://pecl.php.net/get/imagick-3.4.4.tgz && tar -zxvf imagick-3.4.4.tgz && /usr/bin/phpize && \
#    ./configure \
#    --with-php-config=/usr/bin/php-config \
#    --with-imagick=/data/server/other_component/ImageMagick-7.0.9-9 && \
#    make & make install
# RUN curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.rpm.sh | bash
# RUN yum update -y && yum install php74-phalcon
# RUN whereis libmysqlclient.so*
# RUN php -m
RUN mkdir -p /root/app/public

WORKDIR /root/app
COPY ./php-modules.conf /root/app/php-modules.conf
COPY ./php.ini /root/app/php.ini
COPY ./php-fpm.ini /root/app/php-fpm.ini
COPY ./test.php /root/app/test.php
COPY ./test.sh /root/app/test.sh
COPY ./php-modules.php /root/app/php-modules.php
RUN php php-modules.php

RUN patchelf --set-rpath '$ORIGIN' /usr/bin/php
RUN patchelf --set-rpath '$ORIGIN' /usr/bin/php-cgi
RUN patchelf --set-rpath '$ORIGIN' /usr/sbin/php-fpm
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/apcu.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/bcmath.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/bz2.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/calendar.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/ctype.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/curl.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/dom.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/ds.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/exif.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/fileinfo.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/ftp.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/gd.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/gettext.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/iconv.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/imap.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/intl.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/imagick.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/json.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/libfreetype.so.6
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/libgd.so.3
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/mcrypt.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/mbstring.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/mysqli.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/mysqlnd.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/memcached.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/memcache.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/pdo.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/pdo_mysql.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/pdo_pgsql.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/pdo_sqlite.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/pgsql.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/phalcon.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/phar.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/psr.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/simplexml.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/soap.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/sockets.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/sodium.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/sqlite3.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/ssh2.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/swoole.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/tokenizer.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/xml.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/xmlreader.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/xmlrpc.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/xmlwriter.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/xsl.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/yaf.so
RUN patchelf --set-rpath '$ORIGIN' /usr/lib64/php/modules/zip.so

CMD ["/bin/bash", "test.sh"]
