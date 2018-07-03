#!/bin/bash

set -x

ansible-playbook -vvi hosts.ini /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml
ansible-playbook -vvi hosts.ini /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml


