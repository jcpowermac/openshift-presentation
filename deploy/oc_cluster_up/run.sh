#!/bin/bash

set -x
IP=`curl http://169.254.169.254/latest/meta-data/public-ipv4`

PUBLIC_HOSTNAME="${IP}.nip.io"
ROUTING_SUFFIX="apps.${IP}.nip.io"
ENABLE="centos-imagestreams,persistent-volumes,registry,router,sample-templates,service-catalog,template-service-broker,web-console,automation-service-broker"


sudo mkdir -p /tmp/origin
#sudo setenforce 0

sudo /usr/bin/oc cluster up --enable=${ENABLE} --public-hostname=${PUBLIC_HOSTNAME} --routing-suffix=${ROUTING_SUFFIX} --base-dir=/tmp/origin


/usr/bin/oc login ${PUBLIC_HOSTNAME} --username=developer --password=dev --insecure-skip-tls-verify=true
/usr/bin/oc --config /tmp/origin/kube-apiserver/admin.kubeconfig get dc --all-namespaces
