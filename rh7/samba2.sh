yum install -y samba samba-client
yum install -y telnet nmap
systemctl is-enabled smb nmb
systemctl enable smb nmb
systemctl is-active smb nmb
systemctl start smb nmb
firewall-cmd --permanent --add-service=samba
firewall-cmd --reload
