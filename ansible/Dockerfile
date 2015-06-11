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

ENV FLEET_VERSION 0.10.1  
ENV CONFD_VERSION 0.9.0
ENV ETCD_VERSION 2.0.11

ENV ETCD_HOSTS http://127.0.0.1:4001
ENV SSHD_PORT 2023

RUN mkdir -p /opt/bin /etc/confd/conf.d /etc/confd/templates && \
  wget -q https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -O /opt/bin/confd && \
  ln -s /opt/bin/confd /bin/confd && \
  chmod +x /opt/bin/confd

RUN wget -q https://github.com/coreos/fleet/releases/download/v${FLEET_VERSION}/fleet-v${FLEET_VERSION}-linux-amd64.tar.gz -O fleet-v${FLEET_VERSION}-linux-amd64.tar.gz && \
  tar zxvf fleet-v${FLEET_VERSION}-linux-amd64.tar.gz && \
  cp fleet-v${FLEET_VERSION}-linux-amd64/fleetctl /usr/bin/fleetctl && \
  rm -rf fleet-v* && \
  chmod +x /usr/bin/fleetctl

RUN wget -q https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz -O /tmp/etcd.tar.gz && \
  tar zxvf /tmp/etcd.tar.gz -C /tmp && \
  mv /tmp/etcd-v${ETCD_VERSION}-linux-amd64/etcdctl /bin/etcdctl && \
  rm -rf /tmp/etcd.tar.gz /tmp/etcd* && \
  chmod +x /bin/etcdctl

ENTRYPOINT [ "/start.sh" ]
