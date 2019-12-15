FROM library/centos:6.8
RUN yum -y install wget git
RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
# RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/latest.rpm
RUN yum -y install \
  php72w-cli php72w-fpm php72w-mbstring php72w-mysql php72w-opcache \
  php72w-gd php72w-xml
# RUN yum -y install epel-release
RUN yum -y install patchelf

RUN mkdir -p /root/app/public
RUN mkdir -p /root/app/native

WORKDIR /root/app

COPY ./php.ini /root/app/native/php.ini
COPY ./php-fpm.ini /root/app/native/php-fpm.ini
COPY ./test.php /root/app/test.php
COPY ./test.sh /root/app/test.sh

CMD ["/bin/bash", "test.sh"]
