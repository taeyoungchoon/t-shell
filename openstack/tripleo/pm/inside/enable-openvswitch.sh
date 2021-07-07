yum install -y epel-release centos-release-openstack-queens
yum install -y openvswitch libibverbs
systemctl start openvswitch
systemctl enable openvswitch
