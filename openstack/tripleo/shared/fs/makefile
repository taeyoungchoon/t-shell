all: pkg firewall

pkg:
	yum install -y httpd

firewall:
	firewall-cmd --add-service=http --permanent
	firewall-cmd --reload

overcloud-image:
	mkdir /var/www/html/overcloud-image
	cd /var/www/html/overcloud-image
	wget https://images.rdoproject.org/centos7/queens/rdo_trunk/current-tripleo/ironic-python-agent.tar.md5
	wget https://images.rdoproject.org/centos7/queens/delorean/current-tripleo/overcloud-full.tar.md5
	wget https://images.rdoproject.org/centos7/queens/rdo_trunk/current-tripleo/ironic-python-agent.tar
	wget https://images.rdoproject.org/centos7/queens/delorean/current-tripleo/overcloud-full.tar

check:
	cd /var/www/html/overcloud-image
	md5sum *.tar
	cat *.md5
