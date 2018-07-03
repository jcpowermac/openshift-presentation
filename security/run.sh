#!/bin/bash

set -x

#ansible -i 172.31.9.69, -u centos -b -m fetch -a "src=/tmp/origin/kube-apiserver/admin.kubeconfig dest=./ flat=yes" --private-key keypair.pem all


oc get scc
oc describe scc restricted
oc describe scc anyuid

read -n1 -r -p "Press space to continue..." key

oc new-project scctest

oc run scc --image docker.io/fedora:28 --tty=true --stdin=true --restart=Never -- capsh --print

