#!/bin/bash


set -x


oc new-project ansible
oc create -f imagestream.yaml
oc create -f buildconfig.yaml

oc logs -f bc/ara


