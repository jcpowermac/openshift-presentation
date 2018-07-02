#!/bin/bash

set -x

oc export svc,route,dc,bc,is --as-template=ara > openshift-template.yaml

