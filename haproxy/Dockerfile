#
#   Author: Rohith
#   Date: 2015-04-20 12:28:15 +0100 (Mon, 20 Apr 2015)
#
#  vim:ts=2:sw=2:et
#
FROM gambol99/supervisord
MAINTAINER Rohith Jayawardene <gambol99@gmail.com>

RUN yum install -y haproxy

ADD haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg
ADD confd/haproxy.cfg.tmpl /etc/confd/templates/haproxy.cfg.tmpl
ADD confd/haproxy.toml /etc/confd/conf.d/haproxy.toml
ADD confd/haproxy_restart.sh /bin/haproxy_restart.sh
ADD confd/confd_runner.sh /bin/confd_runner.sh
ADD supervisord/haproxy.ini /etc/supervisord.d/haproxy.ini
ADD supervisord/confd.ini /etc/supervisord.d/confd.ini
ADD start.sh /start.sh

RUN chmod +x /start.sh && \
    chmod +x /bin/haproxy_restart.sh && \
    chmod +x /bin/confd_runner.sh

ENTRYPOINT [ "/start.sh" ]
