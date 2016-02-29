FROM centos:centos7
MAINTAINER Daniele Moraschi "daniele.moraschi@gmail.com"

# Base software
#
RUN rpm -Uvh http://mirror.pnl.gov/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum -y update
RUN yum -y install vim git tar gcc make curl sudo
RUN yum clean all &> /dev/null
