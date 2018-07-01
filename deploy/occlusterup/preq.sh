#!/bin/bash

set -x

sudo yum install epel-release -y
sudo yum install vim curl wget docker -y


sudo tee /etc/sysconfig/docker-storage-setup << EOF
STORAGE_DRIVER=overlay2
DEVS=/dev/nvme0n1
CONTAINER_ROOT_LV_NAME=dockerlv
CONTAINER_ROOT_LV_MOUNT_PATH=/var/lib/docker
VG=dockervg
EOF


sudo tee /etc/containers/registries.conf << EOF
[registries.search]
registries = ['docker.io','registry.centos.org','registry.access.redhat.com']

[registries.insecure]
registries = ['172.30.0.0/16']

[registries.block]
registries = []
EOF

sudo tee -a /etc/sysconfig/docker << EOF
INSECURE_REGISTRY='--insecure-registry 172.30.0.0/16'
EOF


sudo systemctl start docker
sudo systemctl enable docker

# Download the latest version of v3.10.0
sudo docker pull docker.io/openshift/origin:v3.10


UUID=`sudo docker run -d --entrypoint=/bin/sh openshift/origin:v3.10 -c 'tail -f /dev/null'`
IPV4=`curl http://169.254.169.254/latest/meta-data/public-ipv4`



sudo docker cp ${UUID}:/usr/bin/oc /usr/bin/

sudo docker rm -f ${UUID}

# prepull

IMAGES=("docker.io/openshift/origin-node:v3.10" "docker.io/openshift/origin-control-plane:v3.10" "docker.io/openshift/origin:v3.10" "docker.io/openshift/origin-hypershift:v3.10" "docker.io/openshift/origin-hyperkube:v3.10" "docker.io/openshift/origin-pod:v3.10" "docker.io/automationbroker/automation-broker-apb:latest" "docker.io/openshift/origin-cli:v3.10")

for i in ${IMAGES[@]}; do
 sudo docker pull ${i}
 done







