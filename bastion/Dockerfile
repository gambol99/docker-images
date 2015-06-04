#
#   Author: Rohith
#   Date: 2015-06-03 18:26:13 +0100 (Wed, 03 Jun 2015)
#
#  vim:ts=2:sw=2:et
#
FROM fedora:latest
MAINTAINER Rohith <gambol99@gmail.com>

ADD config/sshd.ini /etc/supervisord.d/sshd.ini
ADD config/authorized_keys /root/.ssh/authorized_keys

RUN /usr/bin/dnf install -y strace vim tcpdump ansible openssh-server supervisor
RUN chmod 0400 /root/.ssh/authorized_keys

ENTRYPOINT [ "/usr/bin/supervisord", "-n" ]
