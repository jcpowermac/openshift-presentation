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


sudo systemctl start docker


sudo docker pull quay.io/jcallen/che-apb
