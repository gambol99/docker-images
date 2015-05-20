#!/bin/bash
#
#   Author: Rohith
#   Date: 2015-05-20 10:34:12 +0100 (Wed, 20 May 2015)
#
#  vim:ts=2:sw=2:et
#

HAPROXY=/etc/haproxy
HAPROXY_CONFIG=${HAPROXY}/haproxy.cfg
HAPROXY_LATEST=${HAPROXY_CONFIG}.latest

annonce() {
  echo "** $@" >> /var/log/output.log
}

failed() {
  annonce "error: $@"
  exit 1
}

annonce "requesting a restart of the haproxy service"
cat $HAPROXY_LATEST

annonce "verifying the new configuration"
if ! /usr/sbin/haproxy -c -f $HAPROXY_LATEST > /dev/null 2>/dev/null; then
  failed "invalid configuration for haproxy, refusing to restart the service"
fi

annonce "copying the latest configuration over the current and restarting"
cp -f $HAPROXY_LATEST $HAPROXY_CONFIG

annonce "restarting the service"
supervisorctl restart haproxy >/dev/null || failed "unable to restart haproxy service"

