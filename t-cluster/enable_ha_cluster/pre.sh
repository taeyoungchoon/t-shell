yum install gfs2-utils lvm2-cluster dlm -y
yum install iscsi-initiator-utils
yum install targetcli -y
systemctl stop NetworkManager
systemctl disable NetworkManager
yum install epel-release -y
yum install pcs fence-agents-all -y
echo password | passwd --stdin hacluster
systemctl enable --now pcsd
