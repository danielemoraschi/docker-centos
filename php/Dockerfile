FROM dmoraschi/centos7
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# Install PHP and extensions
#
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install \
	php56w \
	php56w-cli \
	php56w-common \
	php56w-devel \
	php56w-fpm \
	php56w-gd \
	php56w-imap \
	php56w-intl \
	php56w-ldap \
	php56w-mbstring \
	php56w-mcrypt \
	php56w-mysqlnd \
	php56w-odbc \
	php56w-opcache \
	php56w-pdo \
	php56w-pear \
	php56w-pecl-apcu \
	php56w-pecl-igbinary \
	php56w-pecl-imagick \
	php56w-pecl-memcache \
	php56w-pecl-memcached \
	php56w-pecl-redis \
	php56w-pecl-xdebug \
	php56w-opcache \
	php56w-process \
	php56w-soap \
	php56w-xml \
	php56w-xmlrpc \
	php-php-gettext
	# php56w-pecl-gearman


# PHPUnit
#
RUN curl -L -O  https://phar.phpunit.de/phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /bin/phpunit


# PECL
#
RUN pear config-set auto_discover 1
RUN pear channel-update pecl.php.net


# APC
#
RUN pecl install apc
RUN echo "extension=apc.so" > /etc/php.d/apc.ini
RUN rm -f /etc/php.d/xcache.ini


# MongoDB
#
RUN yum install -y openssl-devel
RUN pecl install mongodb
RUN echo "extension=mongodb.so" > /etc/php.d/mongodb.ini


# Composer
#
WORKDIR /tmp
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer


# PHP / FPM Configuration
#
RUN sed -i '/^listen/clisten = 0.0.0.0:9000' /etc/php-fpm.d/www.conf
RUN sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php-fpm.d/www.conf
RUN sed -i '/^;env\[TEMP\] = .*/aenv[DB_PORT_3306_TCP_ADDR] = $DB_PORT_3306_TCP_ADDR' /etc/php-fpm.d/www.conf
RUN sed -i 's/;request_slowlog_timeout = 0/request_slowlog_timeout = 10s/' /etc/php-fpm.d/www.conf

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


# Forward request and error logs to docker log collector
#
RUN ln -sf /dev/stdout /var/log/php-fpm/slow.log
RUN ln -sf /dev/stderr /var/log/php-fpm/error.log


# Volumes
#
VOLUME /var/log/php-fpm
VOLUME /data/app/public

RUN mkdir -p /data/app/public
WORKDIR /data/app
EXPOSE 9000

CMD ["php-fpm", "-F"]
