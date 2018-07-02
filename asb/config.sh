#!/bin/bash


set -x

oc -o yaml get configmap <name> -n openshift-ansible-service-broker
