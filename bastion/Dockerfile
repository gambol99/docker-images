#
#   Author: Rohith
#   Date: 2015-06-03 18:26:13 +0100 (Wed, 03 Jun 2015)
#
#  vim:ts=2:sw=2:et
#
FROM fedora:latest
MAINTAINER Rohith <gambol99@gmail.com>

RUN mkdir -p /root/.ssh
RUN mkdir -p /var/run/sshd

ADD config/sshd.ini /etc/supervisord.d/sshd.ini
ADD config/authorized_keys /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys
RUN chown root:root /root/.ssh/authorized_keys
 
RUN /usr/bin/dnf install -y strace vim tcpdump ansible openssh-server supervisor \
  net-tools procps-ng openssh-server

RUN ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_key
RUN ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -b 1024 -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN sed -i 's/UsePAM\syes/UsePAM no/' /etc/ssh/sshd_config
RUN chmod 0400 /root/.ssh/authorized_keys

ENTRYPOINT [ "/usr/bin/supervisord", "-n" ]
