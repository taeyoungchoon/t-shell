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

ls -ltr /httpboot

## neutron
neutron subnet-list
# neutron subnet-update ID --dns-nameserver x.x.x.x

## node
# wget x/instackenv-threenodes.json
# cat *.json
openstack baremetal import --json instackenv-threenodes.json
openstack baremetal configure boot
openstack image list
ironic node-list
ironic node-show controller
#driver_info, deploy_kernel, _ramdisk, the bm_x
openstack baremetal instrospection bulk start
# power off and up then do inspection job
# available
openstack baremetal node list

## flavor
openstack flavor list
openstack flavor create --id auto --ram 2048 --disk 10 --vcpus 2 baremetal
openstack flavor create --id auto --ram 4096 --disk 20 --vcpus 2 compute
openstack flavor create --id auto --ram 4096 --disk 30 --vcpus 2 control
openstack flavor create --id auto --ram 2048 --disk 10 --vcpus 1 ceph-storage

## tag
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" baremetal
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:profile"="control" control
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:profile"="compute" compute
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:profile"="ceph-storage" ceph-storage

## tag node
ironic node-update compute1 add properties/capabilities='profile:compute,boot_option:local'
ironic node-update controller add properties/capabilities='profile:control,boot_option:local'
ironic node-update ceph add properties/capabilities='profile:ceph-storage,boot_option:local'
openstack overcloud profiles list


