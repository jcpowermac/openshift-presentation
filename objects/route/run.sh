#!/bin/bash

set -x


oc create -f service.yaml
oc create -f route.yaml


oc describe route ara

