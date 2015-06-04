#
#   Author: Rohith
#   Date: 2015-06-04 22:47:24 +0100 (Thu, 04 Jun 2015)
#
#  vim:ts=2:sw=2:et
#

AUTHOR=gambol99
NAME=ansible

.PHONY: build

default: build

build:
	sudo /usr/bin/docker build -t ${AUTHOR}/${NAME} .

test:	
	sudo /usr/bin/docker run \
    -ti --rm -p 2023:22 \
    -v /config:/config \
    -v /:/host \
    gambol99/bastion
