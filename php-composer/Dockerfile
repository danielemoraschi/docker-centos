FROM dmoraschi/centos-php
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

WORKDIR /tmp
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer


WORKDIR /data/app
ENTRYPOINT ["composer"]
CMD ["--help"]