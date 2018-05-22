rpm -qi samba >/dev/null 2>/dev/null
if test $? -ne 0; then
	yum install samba -y
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

ls -lZ / | grep smbs
[ ! -e /smbshare ] && mkdir /smbshare
chgrp sales /smbshare
chmod g+rwx /smbshare
ls -l / | grep smbshare
echo "samba home" > /smbshare/samba-home.text
semanage fcontext -a -t samba_share_t /smbshare
restorecon -Rv /smbshare
ls -lZ / | grep smbs

systemctl restart smb nmb
