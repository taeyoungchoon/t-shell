timedatectl
cat <<COMMENT
yum install chrony -y
systemctl status chronyd
systemctl is-enabled chronyd
systemctl enable chronyd
systemctl is-active chronyd
systemctl start chronyd
timedatectl
COMMENT
