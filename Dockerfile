FROM debian:jessie-backports

MAINTAINER voobscout <voobscout@gmail.com>

ENV DEBIAN_FRONTEND noninteractive \
    GIT_SSL_NO_VERIFY 1 \
    container docker

ADD https://github.com/papertrail/remote_syslog2/releases/download/v0.16-beta-pkgs/remote-syslog2_0.16_amd64.deb /

RUN apt-get update -qq && \
    apt-get -qqy dist-upgrade && \
    dpkg -i /remote-syslog2_0.16_amd64.deb && \
    apt-get install -qqfy && \
    rm -rf /remote-syslog2_0.16_amd64.deb && \
    apt-get clean all && \
    rm /var/log/apt/* /var/log/alternatives.log /var/log/bootstrap.log /var/log/dpkg.log
