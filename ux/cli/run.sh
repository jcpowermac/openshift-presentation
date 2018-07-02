#!/bin/bash

# New Project
oc new-project newapp

# New Application from Dockerfile
oc new-app https://github.com/jcpowermac/openshift-presentation --context-dir=objects/buildconfig/docker/


# New Project
oc new-project newbuild

# New BuildConfig, ImageStream from Dockerfile
oc new-build https://github.com/jcpowermac/openshift-presentation --context-dir=objects/buildconfig/docker/



oc new-project importimage

# needs to be updated
oc import-image
