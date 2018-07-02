#!/bin/bash

set -x

oc get scc
oc describe scc restricted
oc describe scc anyuid

