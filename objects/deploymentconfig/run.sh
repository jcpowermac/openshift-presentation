#!/bin/bash



oc project ansible

oc create -f dc.yaml

oc rollout status -w dc/ara

oc get pod --watch

oc get dc ara
