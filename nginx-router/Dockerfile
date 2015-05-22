#
#   Author: Rohith
#   Date: 2015-05-22 10:10:30 +0100 (Fri, 22 May 2015)
#
#  vim:ts=2:sw=2:et
#
FROM gambol99/supervisord
MAINTAINER Rohith <gambol99@gmail.com>

ADD config/start.sh /bin/start.sh
ADD config/confd.sh /bin/confd.sh

RUN yum install -y nginx && \
    chmod +x /bin/start.sh && \
    chmod +x /bin/confd.sh

ADD config/confd/nginx.toml /etc/confd/conf.d/nginx.toml
ADD config/confd/nginx.conf.tmpl /etc/confd/templates/nginx.cfg.tmpl
ADD config/supervisord/confd.ini /etc/supervisord.d/confd.ini
ADD config/supervisord/nginx.ini /etc/supervisord.d/nginx.ini

EXPOSE 80 443

ENTRYPOINT [ "/bin/start.sh" ]
