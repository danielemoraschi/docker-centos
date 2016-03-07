FROM dmoraschi/centos7
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# Gearman
#
RUN yum -y install \
    libgearman \
    libgearman-devel \
    gearmand

WORKDIR /data
CMD ["gearmand"]
