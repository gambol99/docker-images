#!/bin/bash
#
#   Author: Rohith
#   Date: 2015-05-22 10:13:57 +0100 (Fri, 22 May 2015)
#
#  vim:ts=2:sw=2:et
#

export CONFD_BACKEND=${CONFD_BACKEND:-"etcd"}
export CONFD_BACKEND_URL=${CONFD_BACKEND_URL:-"127.0.0.1:4001"}
export CONFD_TOML="/etc/confd/conf.d/nginx.toml"

cat <<EOF > /etc/environment
CONFD_BACKEND=${CONFD_BACKEND}
CONFD_BACKEND_URL=${CONFD_BACKEND_URL}
CONFD_TOML=${CONFD_TOML}
EOF

/usr/bin/supervisord -n
