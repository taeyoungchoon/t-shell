yum install chrony -y
systemctl is-enabled chronyd
systemctl enable chronyd
systemctl is-active chronyd
systemctl start chronyd
timedatectl
