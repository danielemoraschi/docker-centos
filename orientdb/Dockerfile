FROM dmoraschi/centos-openjdk7
MAINTAINER Daniele Moraschi <daniele.moraschi@gmail.com>

# Install OrientDB
#
ENV ROOT /opt
ENV ORIENT_VERSION 2.0.5
ENV ORIENT_REPO_NAME orientdb-community
ENV ORIENT_PACKAGE ${ORIENT_REPO_NAME}-${ORIENT_VERSION}
ENV ORIENT_TAR ${ORIENT_PACKAGE}.tar.gz
ENV ORIENT_URL http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=${ORIENT_TAR}&os=linux

RUN cd ${ROOT} \
    && curl ${ORIENT_URL} > ${ORIENT_TAR}\
    && tar -xzf ${ORIENT_TAR} \
    && ln -s ${ROOT}/${ORIENT_PACKAGE} ${ROOT}/orientdb \
    && ln -s ${ROOT}/orientdb/bin/*.sh /usr/local/bin/ \
    && mkdir /usr/local/log

# Cleanup
#
RUN rm -rf ${ROOT}/${ORIENT_TAR} /tmp/* /var/tmp/*

CMD ["/usr/local/bin/server.sh"]