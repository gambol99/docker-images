#!/bin/bash
#
#   Author: Rohith
#   Date: 2015-05-20 10:34:29 +0100 (Wed, 20 May 2015)
#
#  vim:ts=2:sw=2:et
#

if [ -f /etc/environment ]; then
  . /etc/environment
fi

cat <<EOF
BACKEND: ${CONFD_BACKEND}
URL:     ${CONFD_BACKEND_URL}
CONFIG   ${CONFD_CONFIG}
EOF

/usr/bin/confd -backend ${CONFD_BACKEND} -node $CONFD_BACKEND_URL \
  -config-file=${CONFD_CONFIG} -log-level=debug -watch=true
