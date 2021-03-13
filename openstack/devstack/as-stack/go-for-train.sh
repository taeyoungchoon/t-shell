git clone https://git.openstack.org/openstack-dev/devstack -b stable/train
sh config.sh
cp local.conf devstack/
cd devstack
./stack.sh
