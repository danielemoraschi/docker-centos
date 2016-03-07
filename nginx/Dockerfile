FROM dmoraschi/centos7
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# Install Nginx
#
RUN yum -y install nginx
RUN yum clean all

# Configuration
#
ADD ./conf/nginx.conf /etc/nginx/nginx.conf
ADD ./conf/default.conf /etc/nginx/conf.d/default.conf

# PORTS
#
EXPOSE 80 443

# Forward request and error logs to docker log collector
#
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Volumes
#
VOLUME /var/log/nginx
VOLUME /data

WORKDIR /data
CMD ["nginx"]
