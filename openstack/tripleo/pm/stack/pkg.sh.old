# https://docs.openstack.org/project-deploy-guide/tripleo-docs/latest/deployment/install_undercloud.html

sudo yum install -y wget
sudo wget \
https://trunk.rdoproject.org/centos7/current/python2-tripleo-repos-0.0.1-0.20200409224957.8bac392.el7.noarch.rpm
sudo yum localinstall python2-tripleo-repos-0.0.1-0.20200409224957.8bac392.el7.noarch.rpm
sudo yum install -y
# sudo yum install -y https://trunk.rdoproject.org/centos7/current/python2-tripleo-repos-<version>.el7.centos.noarch.rpm
sudo -E tripleo-repos -b queens current
# sudo -E tripleo-repos -b queens current ceph
sudo yum install -y python-requests
sudo yum install -y python-tripleoclient
# sudo -E tripleo-repos -b queens current ceph
ls /usr/share/instack-undercloud/undercloud.conf.sample
cp /usr/share/instack-undercloud/undercloud.conf.sample ~/undercloud.conf
# openstack undercloud install
# openstack undercloud install --verbose

