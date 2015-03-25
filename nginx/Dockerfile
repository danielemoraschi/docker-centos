FROM dmoraschi/centos7
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# Install Nginx
#
RUN yum -y install nginx
RUN yum clean all

# Configuration
#
ADD ./conf/nginx.conf /etc/nginx/nginx.conf
RUN rm -f /etc/nginx/conf.d/default.conf
ADD ./conf/app.conf /etc/nginx/conf.d/app.conf

# Startup script
#
ADD conf/nginx-start.sh /opt/bin/nginx-start.sh
RUN chmod u=rwx /opt/bin/nginx-start.sh

# Volumes
#
RUN mkdir -p /data

# PORTS
#
EXPOSE 80
EXPOSE 443

WORKDIR /opt/bin
ENTRYPOINT ["/opt/bin/nginx-start.sh"]