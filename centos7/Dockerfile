FROM centos:centos7
MAINTAINER Daniele Moraschi "daniele.moraschi@gmail.com"

# Base software
#
RUN yum -y install epel-release
RUN yum repolist
RUN yum -y update
RUN yum -y group install @base
RUN yum -y group install "Development Tools"
RUN yum clean all
