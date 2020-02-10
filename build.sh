#!/bin/sh
rm -rf ../native
mkdir -p ../native/modules
docker rmi now-php-docker-image --force
docker build . -t now-php-docker-image
docker run now-php-docker-image
# DOCKER_CONTAINER=now-php-docker-image
# DIST_PHP_PATH=../native
# DIST_PHP_MODULES_PATH=${DIST_PHP_PATH}/modules
# DIST_LIB_PATH=${DIST_PHP_PATH}/modules

# Run new one PHP container
# docker run -it -d now-php-docker-image /bin/bash

# Copy php, php-cgi, php-fpm binaries
docker run now-php-docker-image /bin/cat /usr/bin/php > ../native/php
docker run now-php-docker-image /bin/cat /usr/bin/php-cgi > ../native/php-cgi
docker run now-php-docker-image /bin/cat /usr/sbin/php-fpm > ../native/php-fpm

# Make these binaries runutable
chmod +x ../native/php
chmod +x ../native/php-cgi
chmod +x ../native/php-fpm

# Copy php.ini & php-fpm.ini
docker run now-php-docker-image /bin/cat /root/app/php.ini > ../native/php.ini
docker run now-php-docker-image /bin/cat /root/app/php-fpm.ini > ../native/php-fpm.ini

# Copy all compiled extensions
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/apcu.so > ../native/modules/apcu.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/bcmath.so > ../native/modules/bcmath.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/bz2.so > ../native/modules/bz2.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/calendar.so > ../native/modules/calendar.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/ctype.so > ../native/modules/ctype.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/curl.so > ../native/modules/curl.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/dom.so > ../native/modules/dom.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/ds.so > ../native/modules/ds.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/exif.so > ../native/modules/exif.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/fileinfo.so > ../native/modules/fileinfo.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/ftp.so > ../native/modules/ftp.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/gd.so > ../native/modules/gd.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/gettext.so > ../native/modules/gettext.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/iconv.so > ../native/modules/iconv.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/imap.so > ../native/modules/imap.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/intl.so > ../native/modules/intl.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/json.so > ../native/modules/json.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/mbstring.so > ../native/modules/mbstring.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/mysqli.so > ../native/modules/mysqli.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/mysqlnd.so > ../native/modules/mysqlnd.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/opcache.so > ../native/modules/opcache.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/pdo.so > ../native/modules/pdo.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/pdo_mysql.so > ../native/modules/pdo_mysql.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/pdo_pgsql.so > ../native/modules/pdo_pgsql.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/pdo_sqlite.so > ../native/modules/pdo_sqlite.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/pgsql.so > ../native/modules/pgsql.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/phalcon.so > ../native/modules/phalcon.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/phar.so > ../native/modules/phar.so
docker run now-php-docker-image /bin/cat /usr/lib64/libtiff.so.3 > ../native/modules/libtiff.so.3
docker run now-php-docker-image /bin/cat /usr/lib64/libwebp.so.5 > ../native/modules/libwebp.so.5
docker run now-php-docker-image /bin/cat /usr/lib64/mysql/libmysqlclient.so.16 > ../native/modules/libmysqlclient.so.16
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/simplexml.so > ../native/modules/simplexml.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/soap.so > ../native/modules/soap.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/sockets.so > ../native/modules/sockets.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/sodium.so > ../native/modules/sodium.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/sqlite3.so > ../native/modules/sqlite3.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/yaf.so > ../native/modules/yaf.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/zip.so > ../native/modules/zip.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/swoole.so > ../native/modules/swoole.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/tokenizer.so > ../native/modules/tokenizer.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/xml.so > ../native/modules/xml.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/xmlreader.so > ../native/modules/xmlreader.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/xmlrpc.so > ../native/modules/xmlrpc.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/xmlwriter.so > ../native/modules/xmlwriter.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/xsl.so > ../native/modules/xsl.so
docker run now-php-docker-image /bin/cat /usr/lib64/libmcrypt.so.4 > ../native/modules/libmcrypt.so.4
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/redis.so > ../native/modules/redis.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/memcached.so > ../native/modules/memcached.so
docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/memcache.so > ../native/modules/memcache.so

# Copy static libraries. Needed by the extensions above.
docker run now-php-docker-image /bin/cat /usr/lib64/libX11.so.6 > ../native/modules/libX11.so.6
docker run now-php-docker-image /bin/cat /usr/lib64/libXau.so.6 > ../native/modules/libXau.so.6
docker run now-php-docker-image /bin/cat /usr/lib64/libXpm.so.4 > ../native/modules/libXpm.so.4
docker run now-php-docker-image /bin/cat /usr/lib64/libargon2.so.0 > ../native/libargon2.so.0
docker run now-php-docker-image /bin/cat /usr/lib64/libpng12.so.0 > ../native/modules/libpng12.so.0
# docker run now-php-docker-image /bin/cat /usr/lib64/libaudit.so.1 > ../native/modules/libaudit.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/libbz2.so > ../native/modules/libbz2.so
docker run now-php-docker-image /bin/cat /usr/lib64/libc-client.so.2007 > ../native/modules/libc-client.so.2007
# docker run now-php-docker-image /bin/cat /usr/lib64/libcap-ng.so.0 > ../native/modules/libcap-ng.so.0
docker run now-php-docker-image /bin/cat /usr/lib64/libcrypt.so > ../native/modules/libcrypt.so
# docker run now-php-docker-image /bin/cat /usr/lib64/libcrypt.so.1 > ../native/modules/libcrypt.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/libcurl.so.4 > ../native/modules/libcurl.so.4
# docker run now-php-docker-image /bin/cat /usr/lib64/libdw.so.1 > ../native/modules/libdw.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/libedit.so.0 > ../native/modules/libedit.so.0
docker run now-php-docker-image /bin/cat /usr/lib64/libelf.so.1 > ../native/modules/libelf.so.1
# docker run now-php-docker-image /bin/cat /usr/lib64/libexpat.so.1 > ../native/modules/libexpat.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/libexslt.so.0 > ../native/modules/libexslt.so.0
docker run now-php-docker-image /bin/cat /usr/lib64/libfontconfig.so.1 > ../native/modules/libfontconfig.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/libfreetype.so.6 > ../native/modules/libfreetype.so.6
# docker run now-php-docker-image /bin/cat /usr/lib64/libgcrypt.so.11 > ../native/modules/libgcrypt.so.11
docker run now-php-docker-image /bin/cat /usr/lib64/libgd.so.3 > ../native/modules/libgd.so.3
# docker run now-php-docker-image /bin/cat /usr/lib64/libgpg-error.so.0 > ../native/modules/libgpg-error.so.0
# docker run now-php-docker-image /bin/cat /usr/lib64/libicudata.so.62 > ../native/modules/libicudata.so.62
# docker run now-php-docker-image /bin/cat /usr/lib64/libicui18n.so.62 > ../native/modules/libicui18n.so.62
# docker run now-php-docker-image /bin/cat /usr/lib64/libicuio.so.62 > ../native/modules/libicuio.so.62
# docker run now-php-docker-image /bin/cat /usr/lib64/libicuuc.so.62 > ../native/modules/libicuuc.so.62
# docker run now-php-docker-image /bin/cat /usr/lib64/libidn2.so.0 > ../native/modules/libidn2.so.0
# docker run now-php-docker-image /bin/cat /usr/lib64/libjbig.so.2.0 > ../native/modules/libjbig.so.2.0
docker run now-php-docker-image /bin/cat /usr/lib64/libjpeg.so.62 > ../native/modules/libjpeg.so.62
# docker run now-php-docker-image /bin/cat /usr/lib64/liblber-2.4.so.2 > ../native/modules/liblber-2.4.so.2
# docker run now-php-docker-image /bin/cat /usr/lib64/libldap-2.4.so.2 > ../native/modules/libldap-2.4.so.2
# docker run now-php-docker-image /bin/cat /usr/lib64/libldap_r-2.4.so.2 > ../native/modules/libldap_r-2.4.so.2
# docker run now-php-docker-image /bin/cat /usr/lib64/liblz4.so.1 > ../native/modules/liblz4.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/liblzma.so.0 > ../native/modules/liblzma.so.0
docker run now-php-docker-image /bin/cat /usr/lib64/libncurses.so > ../native/modules/libncurses.so
# docker run now-php-docker-image /bin/cat /usr/lib64/libnghttp2.so.14 > ../native/modules/libnghttp2.so.14
docker run now-php-docker-image /bin/cat /usr/lib64/libnss3.so > ../native/modules/libnss3.so
docker run now-php-docker-image /bin/cat /usr/lib64/libonig.so.5 > ../native/modules/libonig.so.5
# docker run now-php-docker-image /bin/cat /usr/lib64/libpam.so.0 > ../native/modules/libpam.so.0
# docker run now-php-docker-image /bin/cat /usr/lib64/libpng15.so.15 > ../native/modules/libpng15.so.15
docker run now-php-docker-image /bin/cat /usr/lib64/libpq.so.5 > ../native/modules/libpq.so.5
docker run now-php-docker-image /bin/cat /usr/lib64/libsasl2.so.2 > ../native/modules/libsasl2.so.2
docker run now-php-docker-image /bin/cat /usr/lib64/libsmime3.so > ../native/modules/libsmime3.so
docker run now-php-docker-image /bin/cat /usr/lib64/libsodium.so.23 > ../native/modules/libsodium.so.23
docker run now-php-docker-image /bin/cat /usr/lib64/libsqlite3.so.0 > ../native/modules/libsqlite3.so.0
docker run now-php-docker-image /bin/cat /usr/lib64/libssh2.so.1 > ../native/modules/libssh2.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/libssl3.so > ../native/modules/libssl3.so
# docker run now-php-docker-image /bin/cat /usr/lib64/libsystemd.so.0 > ../native/modules/libsystemd.so.0
# docker run now-php-docker-image /bin/cat /usr/lib64/libtiff.so.5 > ../native/modules/libtiff.so.5
docker run now-php-docker-image /bin/cat /usr/lib64/libtinfo.so > ../native/modules/libtinfo.so
# docker run now-php-docker-image /bin/cat /usr/lib64/libunistring.so.0 > ../native/modules/libunistring.so.0
# docker run now-php-docker-image /bin/cat /usr/lib64/libwebp.so.7 > ../native/modules/libwebp.so.7
docker run now-php-docker-image /bin/cat /usr/lib64/libxcb.so.1 > ../native/modules/libxcb.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/libxml2.so.2 > ../native/modules/libxml2.so.2
docker run now-php-docker-image /bin/cat /usr/lib64/libxslt.so.1 > ../native/modules/libxslt.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/libmagic.so.1 > ../native/modules/libmagic.so.1
docker run now-php-docker-image /bin/cat /usr/lib64/libmagic.so.1.0.0 > ../native/modules/libmagic.so.1.0.0
docker run now-php-docker-image /bin/cat /usr/lib64/libmcheck.a > ../native/modules/libmcheck.a
docker run now-php-docker-image /bin/cat /usr/lib64/libmcrypt.so.4 > ../native/modules/libmcrypt.so.4
docker run now-php-docker-image /bin/cat /usr/lib64/libmcrypt.so.4.4.8 > ../native/modules/libmcrypt.so.4.4.8
docker run now-php-docker-image /bin/cat /usr/lib64/libz.so > ../native/modules/libz.so
docker run now-php-docker-image /bin/cat /usr/lib64/libz.so > ../native/modules/libz.so
# docker run now-php-docker-image /bin/cat /usr/lib64/libz.so.1.2.7 > ../native/modules/libz.so.1.2.7
docker run now-php-docker-image /bin/cat /usr/lib64/libzip.so.5 > ../native/modules/libzip.so.5
# docker run now-php-docker-image /bin/cat /usr/lib64/libzip.so.5.0 > ../native/modules/libzip.so.5.0
docker run now-php-docker-image /bin/cat /usr/local/lib/libmemcachedutil.so.2 > ../native/modules/libmemcachedutil.so.2
docker run now-php-docker-image /bin/cat /usr/local/lib/libmemcached.so > ../native/modules/libmemcached.so
docker run now-php-docker-image /bin/cat /usr/local/lib/libmemcached.so.11 > ../native/modules/libmemcached.so.11
docker run now-php-docker-image /bin/cat /usr/local/lib/libmemcachedutil.so > ../native/modules/libmemcachedutil.so
docker run now-php-docker-image /bin/cat /usr/lib64/libMagickCore.so > ../native/modules/libMagickCore.so
docker run now-php-docker-image /bin/cat /usr/lib64/libMagickCore.so.5 > ../native/modules/libMagickCore.so.5
docker run now-php-docker-image /bin/cat /usr/lib64/libMagickWand.so > ../native/modules/libMagickWand.so
docker run now-php-docker-image /bin/cat /usr/lib64/libMagickWand.so.5 > ../native/modules/libMagickWand.so.5


while read module; do
  docker run now-php-docker-image /bin/cat /usr/lib64/php/modules/$module.so > ../native/modules/$module.so
#  docker run now-php-docker-image /bin/cat /usr/lib64/$module.so > ../native/modules/lib64/$module.so
done <php-modules.conf

# sed -i'.original' 's#/root/app/modules/#/root/app/native/modules/#g' ../native/php.ini

# chmod +x ../native/php-fpm
# chmod +x ../native/php
