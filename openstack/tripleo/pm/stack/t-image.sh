#!/usr/bin/env bash

cd ../
source stackrc
openstack image list

## image first
# https://docs.openstack.org/project-deploy-guide/tripleo-docs/latest/deployment/install_overcloud.html
# download images
wget https://images.rdoproject.org/centos7/queens/rdo_trunk/current-tripleo/ironic-python-agent.tar
wget https://images.rdoproject.org/centos7/queens/rdo_trunk/current-tripleo/overcloud-full.tar

# extract
mkdir ~/images
tar xf ironic-python-agent.tar -C images
tar xf overcloud-full.tar -C images

## image upload
cd images
openstack overcloud image upload
openstack image list
