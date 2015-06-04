#
#   Author: Rohith
#   Date: 2015-06-04 22:41:07 +0100 (Thu, 04 Jun 2015)
#
#  vim:ts=2:sw=2:et
#

FROM gliderlabs/alpine
MAINTAINER Rohith <gambol99@gmail.com>

RUN apk-install bash openssh supervisor python
RUN mkdir -p /etc/supervisor.d/ 

ADD config/sshd.ini /etc/supervisord.d/sshd.ini
ADD start.sh /start.sh

RUN ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_key -q -N "" && \
  ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_rsa_key -q -N "" && \
  ssh-keygen -b 1024 -t dsa -f /etc/ssh/ssh_host_dsa_key -q -N "" && \
  sed -i 's/UsePAM\syes/UsePAM no/' /etc/ssh/sshd_config && \
  chmod +x /start.sh

ENTRYPOINT [ "/start.sh" ]

