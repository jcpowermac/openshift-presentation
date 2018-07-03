#!/bin/bash


set -x

oc -o yaml get configmap broker-config -n openshift-automation-service-broker



