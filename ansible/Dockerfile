#
#   Author: Rohith
#   Date: 2015-06-04 22:41:07 +0100 (Thu, 04 Jun 2015)
#
#  vim:ts=2:sw=2:et
#

FROM gliderlabs/alpine
MAINTAINER Rohith <gambol99@gmail.com>

RUN apk-install bash openssh supervisor openssl python sudo

ADD config/sshd_config /etc/ssh/sshd_config
ADD config/supervisord/sshd.ini /etc/supervisor.d/sshd.ini
ADD config/supervisord/confd.ini /etc/supervisor.d/confd.ini
ADD config/confd/hosts.toml /etc/confd/conf.d/hosts.toml
ADD config/confd/hosts.cfg.tmpl /etc/confd/templates/hosts.cfg.tmpl
ADD start.sh /start.sh

RUN ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_key -q -N "" && \
  ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_rsa_key -q -N "" && \
  ssh-keygen -b 1024 -t dsa -f /etc/ssh/ssh_host_dsa_key -q -N "" && \
  chmod +x /start.sh

ENV VERSION 0.10.1  
ENV ETCD_HOSTS http://127.0.0.1:4001
ENV SSHD_PORT 2023

RUN mkdir -p /opt/confd/bin /etc/confd/conf.d /etc/confd/templates && \
  wget -q https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 -O /opt/confd/bin/confd && \
  ln -s /opt/confd/bin/confd /bin/confd && \
  chmod +x /opt/confd/bin/confd

RUN wget -q https://github.com/coreos/fleet/releases/download/v${VERSION}/fleet-v${VERSION}-linux-amd64.tar.gz -O fleet-v${VERSION}-linux-amd64.tar.gz && \
  tar zxvf fleet-v${VERSION}-linux-amd64.tar.gz && \
  cp fleet-v${VERSION}-linux-amd64/fleetctl /usr/bin/fleetctl && \
  rm -rf fleet-v* && \
  chmod +x /usr/bin/fleetctl

ENTRYPOINT [ "/start.sh" ]

