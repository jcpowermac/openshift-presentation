#!bin/bash


oc new-project bc-s2i

oc create -f imagestream.yaml
oc create -f buildconfig.yaml

oc logs -f bc/nodejs-mongodb-example
