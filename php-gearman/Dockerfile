FROM dmoraschi/php
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# Gearman
#
RUN yum -y install
    libgearman \
    libgearman-devel \
    gearmand

RUN pecl install gearman
RUN echo extension=gearman.so > /etc/php.d/gearman.ini

WORKDIR /data
ENTRYPOINT ["/opt/bin/phpfpm-start.sh"]