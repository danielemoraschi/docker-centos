FROM dmoraschi/centos7
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# Install PHP and extensions
#
RUN yum -y install \
	php 
#	php-common \
#	php-cli \
#	php-devel \
#	php-dom \
#	php-fpm \
#	php-gd \
#	php-ldap \
#	php-mcrypt \
#	php-mysql \
#	php-opcache \
#	php-redis \
#	php-soap \
#	php-xml \
#	php-xmlrpc \
#	php-pear \
#	php-pdo \
#	php-pear \
#	php-phpunit \
#	php-pecl-mongo \
#	php-pecl-memcache \
#	php-pecl-memcached \
#	php-pecl-igbinary \
#	php-php-gettext


# PECL
#
RUN pear config-set auto_discover 1
RUN pear channel-update pecl.php.net
RUN pear upgrade


# APC
#
RUN pecl install apc
RUN echo "extension=apc.so" > /etc/php.d/apc.ini
RUN rm -f /etc/php.d/xcache.ini


# PHP / FPM Configuration
#
RUN sed -i '/^listen/clisten = 0.0.0.0:9000' /etc/php-fpm.d/www.conf
RUN sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php-fpm.d/www.conf
RUN sed -i '/^;env\[TEMP\] = .*/aenv[DB_PORT_3306_TCP_ADDR] = $DB_PORT_3306_TCP_ADDR' /etc/php-fpm.d/www.conf

RUN sed -i "s/error_reporting/;error_reporting/g" /etc/php.ini
RUN sed -i "s/display_errors = Off/display_errors = stderr/g" /etc/php.ini

RUN sed -i "s/session.save_handler/;session.save_handler/g" /etc/php.ini
RUN sed -i "s/session.save_path/;session.save_path/g" /etc/php.ini

RUN sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 30M/g" /etc/php.ini
RUN sed -i "s/memory_limit = 128M/memory_limit = 512M/g" /etc/php.ini

RUN sed -i "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php.ini
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php.ini

RUN echo "error_reporting = E_ALL & ~E_DEPRECATED" >> /etc/php.ini
RUN echo "date.timezone = 'UTC'" >> /etc/php.ini
RUN echo "; [end]" >> /etc/php.ini


# Volumes
#
RUN mkdir -p /data/app

WORKDIR /data/app
EXPOSE 9000

CMD ["php-fpm", "-F"]
