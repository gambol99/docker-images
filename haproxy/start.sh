#!/bin/bash
#
#   Author: Rohith
#   Date: 2015-05-20 10:23:24 +0100 (Wed, 20 May 2015)
#
#  vim:ts=2:sw=2:et
#

annonce() {
  [ -n "$@" ] || echo "[${SERVICE_NAME}] $@"
}

SERVICE=${SERVICE_NAME:-"haproxy"}
CONFD_BACKEND=${CONFD_BACKEND:-"etcd"}
CONFD_BACKEND_URL=${CONFD_BACKEND_URL:-"https://127.0.0.1:4001"}
CONFD_CONFIG=${CONFD_CONFIG:-/etc/confd/conf.d/haproxy.toml}

annonce "generating the environment file"
cat <<EOF >> /etc/environment
HAPROXY_BIND=*
SERVICE=${SERVICE}
CONFD_CONFIG=${CONFD_CONFIG}
CONFD_BACKEND=${CONFD_BACKEND}
CONFD_BACKEND_URL=${CONFD_BACKEND_URL}
EOF

#annonce "generating the haproxy configuration"
#until confd -onetime -backend ${CONFD_BACKEND} -node ${CONFD_BACKEND_URL} \
#  -config-file=/etc/confd/conf.d/haproxy.toml -log-level debug; do
#  annonce "waiting for confd to refresh ${SERVICE} config"
#  sleep 1
#done

annonce "starting supervisord service"
/usr/bin/supervisord -n
