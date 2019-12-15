FROM library/centos:6.8
RUN yum -y install wget git
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum -y install \
  php73w-cli php73w-fpm php73w-mbstring php73w-mysql php73w-opcache \
  php73w-gd php73w-xml
RUN yum -y install epel-release
RUN yum -y install patchelf

RUN mkdir -p /root/app/public
RUN mkdir -p /root/app/native

WORKDIR /root/app

COPY ./php.ini /root/app/native/php.ini
COPY ./php-fpm.ini /root/app/native/php-fpm.ini
COPY ./test.php /root/app/test.php
COPY ./test.sh /root/app/test.sh

CMD ["/bin/bash", "test.sh"]
