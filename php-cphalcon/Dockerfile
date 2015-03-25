FROM dmoraschi/centos-php
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# PhalconPhp
#
ENV CPHALCON_VERSION master

WORKDIR /tmp
RUN git clone https://github.com/phalcon/cphalcon -b ${CPHALCON_VERSION}
WORKDIR cphalcon/build

RUN ./install;
WORKDIR /tmp
RUN rm -rf cphalcon
RUN echo extension=phalcon.so > /etc/php.d/phalcon.ini


WORKDIR /data/app
CMD ["php-fpm", "-F"]