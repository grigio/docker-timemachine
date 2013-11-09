# docker build -t my/tm .
# docker run -i -t my/tm bash
# Inspired by http://ubuntuforums.org/showthread.php?t=2105755

FROM ubuntu:12.04
MAINTAINER Luigi Maselli

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y python-software-properties
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

RUN add-apt-repository -y ppa:jofko/ppa
RUN apt-get update

RUN apt-get install -y netatalk avahi-daemon

# static patching
RUN sed 's/ENABLE_DAEMON=0$/ENABLE_DAEMON=1/' -i /etc/default/netatalk

ADD afp.conf /etc/netatalk/afp.conf
ADD afpd.service /etc/avahi/services/afpd.service

ADD start.sh /start.sh

