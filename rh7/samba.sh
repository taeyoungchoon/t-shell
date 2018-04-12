<<<<<<< HEAD
yum install -y samba samba-client
yum install -y telnet nmap
systemctl is-enabled smb nmb
systemctl enable smb nmb
systemctl is-active smb nmb
systemctl start smb nmb
firewall-cmd --permanent --add-service=samba
firewall-cmd --reload
=======
rpm -qi samba >/dev/null 2>/dev/null
if test $? -ne 0; then
	yum install samba
fi

systemctl is-enabled smb nmb >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl enable smb nmb
fi

systemctl is-active smb nmb >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl start smb nmb
fi

systemctl status smb nmb

yum install samba-client telnet nmap -y

firewall-cmd --permanent --add-service=samba
firewall-cmd --reload
firewall-cmd --list-all
>>>>>>> 1634bef8cb0c20f7b2e5af076aacd6ba6cab953f
