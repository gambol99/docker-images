#
#   Author: Rohith
#   Date: 2015-06-04 14:37:05 +0100 (Thu, 04 Jun 2015)
#
#  vim:ts=2:sw=2:et
#

AUTHOR=gambol99
NAME=bastion

.PHONY: build

default: build

build:
	sudo /usr/bin/docker pull fedora:latest
	sudo /usr/bin/docker build -t ${AUTHOR}/${NAME} .

test:	
	sudo /usr/bin/docker run \
    -ti --rm \
    --pid=host --net=host --ipc=host \
    -v /config:/config \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/run/fleet.sock:/var/run/fleet.sock \
    -v /var/run/dbus:/var/run/dbus \
    -v /run/systemd:/run/systemd \
    -v /etc/systemd/system:/etc/systemd/system \
    -v /:/host \
    gambol99/bastion
