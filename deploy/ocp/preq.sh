#!/bin/bash

set -x

subscription-manager repos --disable="*"

subscription-manager config --rhsm.auto_enable_yum_plugins=0

subscription-manager register --username='jcallen@redhat.com'

subscription-manager attach --pool=8a85f98260c27fc50160c328c08a5045

subscription-manager repos \
    --enable="rhel-7-server-rpms" \
    --enable="rhel-7-server-extras-rpms" \
    --enable="rhel-7-server-ose-3.9-rpms" \
    --enable="rhel-7-fast-datapath-rpms" \
    --enable="rhel-7-server-ansible-2.4-rpms"

yum update -y
yum install vim curl wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct -y

yum install docker-1.13.1 openshift-ansible -y

tee -a /etc/sysconfig/docker << EOF
INSECURE_REGISTRY='--insecure-registry 172.30.0.0/16'
EOF

tee /etc/sysconfig/docker-storage-setup << EOF
STORAGE_DRIVER=overlay2
DEVS=/dev/nvme0n1
CONTAINER_ROOT_LV_NAME=dockerlv
CONTAINER_ROOT_LV_MOUNT_PATH=/var/lib/docker
VG=dockervg
EOF


systemctl start docker

wget https://raw.githubusercontent.com/jcpowermac/openshift-presentation/master/install/ansible/hosts.ini
