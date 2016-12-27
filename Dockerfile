FROM        python:2.7
MAINTAINER  WeiLiang Qian <gliese.q@gmail.com>
LABEL       Description="Docker image for Luigi central scheduler."
ENV         DEBIAN_FRONTEND noninteractive

#
# Setup proxy (optional)
#
RUN        echo 'Acquire::http::Proxy "http://172.26.10.18:3142";' > /etc/apt/apt.conf.d/02proxy

#
# Install packages
#
RUN         set -x \
            && apt-get update \
            && apt-get install -y --no-install-recommends sqlite3

RUN         set -x \
            && pip install sqlalchemy luigi


ENV         LUIGI_HOME=/luigi
RUN         mkdir -p $LUIGI_HOME

VOLUME      $LUIGI_HOME

WORKDIR     $LUIGI_HOME


