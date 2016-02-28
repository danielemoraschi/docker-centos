FROM dmoraschi/centos7
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# Install Nginx
#
RUN yum -y install nginx
RUN yum clean all

# Configuration
#
ADD ./conf/nginx.conf /etc/nginx/nginx.conf
ADD ./conf/app.conf /etc/nginx/conf.d/default.conf

# PORTS
#
EXPOSE 80
EXPOSE 443

RUN mkdir -p /data/app/public
WORKDIR /data/app
CMD ["nginx"]
