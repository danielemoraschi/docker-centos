FROM dmoraschi/php
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# PhalconPhp
#
WORKDIR /tmp
RUN git clone https://github.com/phalcon/cphalcon #-b 1.2.6
WORKDIR cphalcon/build

RUN ./install;
WORKDIR /tmp
RUN rm -rf cphalcon
RUN echo extension=phalcon.so > /etc/php.d/phalcon.ini


WORKDIR /data

ENTRYPOINT ["/opt/bin/phpfpm-start.sh"]