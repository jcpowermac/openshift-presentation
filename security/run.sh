#!/bin/bash

set -x

oc get scc
oc describe scc restricted
oc describe scc anyuid

read -n1 -r -p "Press space to continue..." key

oc new-project scctest

oc run scc --image docker.io/fedora:28 --tty=true --stdin=true --restart=Never -- capsh --print

