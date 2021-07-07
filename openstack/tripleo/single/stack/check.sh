source ~/stackrc
openstack endpoint list
openstack host list
cat /etc/os-net-config/config.json
python -m json.tool /etc/os-net-config/config.json
sudo ovs-vsctl show
ls /etc/sysconfig/network-script/ifcfg-br-ctlplane
cat /etc/sysconfig/network-script/ifcfg-br-ctlplane

ls .instack/
ironic node-list
openstack baremetal node list
ls /httpboot
ls /etc/sysconfig/network-scripts/ifcfg-eth1
ls /etc/ironic-inspector
