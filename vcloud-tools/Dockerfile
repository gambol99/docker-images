#
#   Author: Rohith
#   Date: 2015-05-21 21:41:21 +0100 (Thu, 21 May 2015)
#
#  vim:ts=2:sw=2:et
#
FROM centos:centos7
MAINTAINER Rohith <gambol99@gmail.com>

RUN yum install -y ruby ruby-devel patch rubygems tar make gcc libxml2-devel
RUN gem install -V vcloud-tools -v 1.0.0
RUN yum install -y vim

ADD ./start.sh /start.sh
ADD config/vcloud-core/lib/vcloud/core/vm.rb /usr/local/share/gems/gems/vcloud-core-1.0.2/lib/vcloud/core/vm.rb
ADD config/vcloud-core/lib/vcloud/core/fog/service_interface.rb /usr/local/share/gems/gems/vcloud-core-1.0.2/lib/vcloud/core/fog/service_interface.rb

ADD config/vcloud-launcher/lib/vcloud/launcher/vm_orchestrator.rb /usr/local/share/gems/gems/vcloud-launcher-1.0.0/lib/vcloud/launcher/vm_orchestrator.rb
ADD config/vcloud-launcher/lib/vcloud/launcher/schema/vm.rb /usr/local/share/gems/gems/vcloud-launcher-1.0.0/lib/vcloud/launcher/schema/vm.rb

RUN chmod +x /start.sh

ENTRYPOINT [ "./start.sh" ]
