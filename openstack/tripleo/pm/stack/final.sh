openstack server list
ssh heat-admin@x
sudo ceph -s
# ssh -t -q -o BatchMode=yes -o ConnectTimeout=5 -o StrictHostKeyChecking=no 
openstack-status

# source overcloudrc
openstack-status

ssh heat-admin@control
openstack-service status 
openstack-service status glance
systemctl status openstack-swift-account-auditor
openstack-service status swift
openstack-service restart swift
