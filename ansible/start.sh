#!/bin/bash
#
#   Author: Rohith
#   Date: 2015-06-04 22:53:42 +0100 (Thu, 04 Jun 2015)
#
#  vim:ts=2:sw=2:et
#

chmod 0400 $HOME/.ssh/authorized_keys

/usr/bin/supervisord -n
