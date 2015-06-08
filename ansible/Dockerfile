#
#   Author: Rohith
#   Date: 2015-06-04 22:41:07 +0100 (Thu, 04 Jun 2015)
#
#  vim:ts=2:sw=2:et
#

FROM gliderlabs/alpine
MAINTAINER Rohith <gambol99@gmail.com>

RUN apk-install bash openssh supervisor python curl sudo
RUN mkdir -p /etc/supervisor.d/ 

ADD config/sshd_config /etc/ssh/sshd_config
ADD config/sshd.ini /etc/supervisor.d/sshd.ini
ADD start.sh /start.sh

RUN ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_key -q -N "" && \
  ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_rsa_key -q -N "" && \
  ssh-keygen -b 1024 -t dsa -f /etc/ssh/ssh_host_dsa_key -q -N "" && \
  chmod +x /start.sh

ENV VERSION 0.10.1  

RUN curl -LOks https://github.com/coreos/fleet/releases/download/v${VERSION}/fleet-v${VERSION}-linux-amd64.tar.gz && \
  tar zxvf fleet-v${VERSION}-linux-amd64.tar.gz && \
  cp fleet-v${VERSION}-linux-amd64/fleetctl /usr/bin/fleetctl && \
  rm -rf fleet-v* && \
  chmod +x /usr/bin/fleetctl

ENTRYPOINT [ "/start.sh" ]

