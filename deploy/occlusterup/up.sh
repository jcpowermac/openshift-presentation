#!/bin/bash

set -x
IP=`curl http://169.254.169.254/latest/meta-data/public-ipv4`

PUBLIC_HOSTNAME="${IP}.nip.io"
ROUTING_SUFFIX="apps.${IP}.nip.io"
ENABLE="automation-service-broker, centos-imagestreams, persistent-volumes, registry, router, sample-templates, service-catalog, template-service-broker, web-console"

mkdir -p /tmp/origin

setenforce 0
/usr/bin/oc cluster up --enable=${ENABLE} --public-hostname=${PUBLIC_HOSTNAME} --routing-suffix=${ROUTING_SUFFIX} --base-dir=/tmp/origin

