#
#   Author: Rohith
#   Date: 2015-04-20 12:08:18 +0100 (Mon, 20 Apr 2015)
#
#  vim:ts=2:sw=2:et
#
FROM centos:centos7
MAINTAINER Rohith Jayawardene <gambol99@gmail.com>

# install base packages
RUN yum install -y curl unzip tar

# install configuration management
RUN mkdir -p /etc/consul-template/conf /etc/consul-template/templates /opt/consul-template/bin && \ 
  curl -sLk https://github.com/hashicorp/consul-template/releases/download/v0.9.0/consul-template_0.9.0_linux_amd64.tar.gz > /opt/consul-template/consul-template.tar.gz && \
  tar zxf /opt/consul-template/consul-template.tar.gz -C /opt/consul-template && \
  mv /opt/consul-template/consul-template_*_linux_amd64/consul-template /opt/consul-template/bin && \
  ln -s /opt/consul-template/bin/consul-template /bin/consul-template && \
  chmod +x /opt/consul-template/bin/consul-template && \
  chown root: -R /opt/consul-template

ENV CONSUL_CONFIG /etc/consul-template/conf
ENV CONSUL_TEMPLATES /etc/consul-template/templates
ENV CONSUL_TEMPLATE /bin/consul-template
ENV CONSUL_HOST 172.17.42.1:8500

