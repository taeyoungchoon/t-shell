#git clone https://git.openstack.org/openstack-dev/devstack -b stable/rocky
git clone https://git.openstack.org/openstack-dev/devstack -b stable/pike
cp local.conf devstack/
cd devstack
./stack.sh
