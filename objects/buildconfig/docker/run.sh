#!/bin/bash


set -x

oc login nip.io:8443 --username=developer --password=dev --insecure-skip-tls-verify=true

oc new-project ansible
oc create -f imagestream.yaml
oc create -f buildconfig.yaml

oc logs -f bc/ara


