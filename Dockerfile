# docker build -t my/tm .
# docker run -i -t my/tm bash
# Inspired by http://ubuntuforums.org/showthread.php?t=2105755

FROM ubuntu:12.04
MAINTAINER Luigi Maselli

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y netatalk avahi-daemon libnss-mdns language-pack-en #libc6-dev

# patching
RUN sed 's/mdns4$/mdns4 mdns/' -i /etc/nsswitch.conf

# NOTE: maybe it could be inline but I've some escape problems in the Dockerfile
ADD afpd.service > /etc/avahi/services/afpd.service

RUN sed 's#~/#/TimeCapsule#' -i /etc/netatalk/AppleVolumes.default
RUN sed 's#Home Directory#Time Capsule (Virtual)#' -i /etc/netatalk/AppleVolumes.default

ADD start.sh /start.sh
ENTRYPOINT ["/start.sh"]
