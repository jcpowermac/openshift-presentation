#!/bin/bash

set -x


oc new-project bc-pipeline
oc create -f buildconfig.yaml

oc get pod --watch


oc start-build pipeline
