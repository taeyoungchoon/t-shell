sudo yum install -y https://trunk.rdoproject.org/centos7/current/python2-tripleo-repos-0.0.1-0.20200409224957.8bac392.el7.noarch.rpm
sudo -E tripleo-repos -b queens current
sudo yum install -y python-tripleoclient
# cp /usr/share/python-tripleoclient/undercloud.conf.sample undercloud.conf
