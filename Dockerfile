FROM        ubuntu:xenial
MAINTAINER  WeiLiang Qian <gliese.q@gmail.com>
LABEL       Description="Docker image for Luigi central scheduler."
ENV         DEBIAN_FRONTEND noninteractive

#
# Setup locale
#
RUN         locale-gen en_US.UTF-8
ENV         LANG=en_US.UTF-8 \
            LANGUAGE=en_US:en \
            LC_ALL=en_US.UTF-8

#
# Setup proxy (optional)
#
RUN        echo 'Acquire::http::Proxy "http://172.26.10.18:3142";' > /etc/apt/apt.conf.d/02proxy

#
# Install packages
#
RUN         set -x \
            && apt-get update \
            && apt-get install -y --no-install-recommends \
                locales \
                python-pip \
				python-setuptools \
				sqlite3

RUN         set -x \
	        && pip install wheel

RUN         set -x \
            && pip install sqlalchemy luigi


ENV	        LUIGI_HOME=/luigi
RUN         mkdir -p $LUIGI_HOME
WORKDIR     $LUIGI_HOME





