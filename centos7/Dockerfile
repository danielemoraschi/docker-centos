FROM centos:centos7
MAINTAINER Daniele Moraschi "daniele.moraschi@gmail.com"

# Base software
#
RUN yum -y install epel-release
RUN yum repolist
RUN yum -y update
RUN yum -y install vim git tar gcc make curl sudo
RUN yum clean all &> /dev/null
