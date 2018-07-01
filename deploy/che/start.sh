#!/bin/bash
set -x


HOSTNAME=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
mkdir -p /che/data
mkdir -p /che/sync
mkdir -p /che/unison

setenforce 0

sudo docker run -it --rm \
    -e CHE_MULTIUSER=true \
    -e CHE_HOST=${HOSTNAME} \
    -v /var/run/docker.sock:/var/run/docker.sock:Z \
    -v /che/data:/data:Z \
    -v /che/sync:/sync:Z \
    -v /che/unison:/unison:Z 'eclipse/che:6.7.1' $@

