#!/bin/bash

#set -x

BASE_DIR="/tmp/origin"
OC_BIN="/usr/bin/oc"
OC_ARGS="cluster down"
CLUSTER_UP_ARGS=""

mkdir -p ${BASE_DIR}

echo "Running ${OC_BIN} ${OC_ARGS} ${CLUSTER_UP_ARGS}"

sudo podman run -it --rm --net host --privileged \
    --entrypoint=${OC_BIN} \
    -v ${BASE_DIR}:${BASE_DIR}:Z \
    -v /var/run/docker.sock:/var/run/docker.sock:Z \
    openshift/origin:v3.10.0 \
    ${OC_ARGS} ${CLUSTER_UP_ARGS}

#sudo podman run -it --rm --net host --privileged \
#    --entrypoint=${OC_BIN} \
#    -v /tmp/origin:/tmp/origin:Z \
#    -v /var/run/docker.sock:/var/run/docker.sock:Z \
#    openshift/origin:v3.10.0 \
#    cluster up \
#    --public-hostname 10.53.4.20.nip.io \
#    --routing-suffix apps.10.53.4.20.nip.io \
#    --base-dir /tmp/origin
