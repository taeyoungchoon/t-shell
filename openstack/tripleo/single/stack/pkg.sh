sudo yum install -y wget
sudo wget \
https://trunk.rdoproject.org/centos7/current/python2-tripleo-repos-0.0.1-0.20200409224957.8bac392.el7.noarch.rpm
sudo yum localinstall python2-tripleo-repos-0.0.1-0.20200409224957.8bac392.el7.noarch.rpm
sudo -E tripleo-repos -b queens current
sudo yum install python-requests -y
sudo yum install python-tripleoclient -y
ls /usr/share/instack-undercloud/undercloud.conf.sample
cp /usr/share/instack-undercloud/undercloud.conf.sample ~/undercloud.conf
