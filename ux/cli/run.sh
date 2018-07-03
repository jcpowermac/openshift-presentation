#!/bin/bash

# New Project
oc new-project newbuild

# New BuildConfig, ImageStream from Dockerfile
oc new-build https://github.com/jcpowermac/openshift-presentation --context-dir=objects/buildconfig/docker/

# New Project
oc new-project newapp

# New Application from Dockerfile
oc new-app https://github.com/jcpowermac/openshift-presentation --context-dir=objects/buildconfig/docker/


# imagestreams
oc new-project importimage

oc import-image fedora:28 --from docker.io/fedora:28 --confirm
oc get is
oc get istag

oc get is -n openshift

