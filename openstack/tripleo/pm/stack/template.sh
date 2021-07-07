mkdir templates
cp -rf /usr/share/openstack-tripleo-heat-templates/* templates
ls templates
# templates/puppet/hieradata/ceph.yaml
ironic node-list

## deploy.sh
openstack overcloud deploy --templates templates --control-scale 1 --compute-scale 1 --ceph-storage-scale 1 \
--neutron-tunnel-types vxlan --neutron-network-type vxlan \
-e templates/compute-extraconfig.yaml -e templates/network-isolation.yaml -e template/storage-environment.yaml -e template/network-environment.yaml -e templates/pre-config-x.yaml

## extra
watch ironic node-list
# avail, wait, deploy, active 
watch -n 30 'heat resource-list -n 5 overcloud | grep -v _COMPLETE'

