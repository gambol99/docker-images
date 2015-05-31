#!/bin/bash
#
#   Author: Rohith
#   Date: 2015-05-21 21:50:31 +0100 (Thu, 21 May 2015)
#
#  vim:ts=2:sw=2:et
#

cd /root
cat <<-EOF > /root/.fog
hod_com:
  vcloud_director_username: $VCLOUD_USERNAME
  vcloud_director_host: api.vcd.portal.skyscapecloud.com
  vcloud_director_password: ''
EOF

/bin/bash
