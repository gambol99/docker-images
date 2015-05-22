#!/bin/bash
#
#   Author: Rohith
#   Date: 2015-05-22 10:30:40 +0100 (Fri, 22 May 2015)
#
#  vim:ts=2:sw=2:et
#

[ -f /etc/environment ] && . /etc/environment

cat <<EOF
BACKEND: ${CONFD_BACKEND}
URL:     ${CONFD_BACKEND_URL}
CONFIG   ${CONFD_TOML}
EOF

/usr/bin/confd -backend ${CONFD_BACKEND} -node $CONFD_BACKEND_URL \
  -config-file=${CONFD_TOML} -log-level=debug -watch=true
