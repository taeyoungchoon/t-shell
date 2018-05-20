rpm -qi nfs-utilZ >/dev/null 2>/dev/null
if test $? -ne 0; then
	yum install nfs-utils -y
fi

systemctl is-enabled nfs-server >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl enable nfs-server
fi

systemctl is-active nfs-server >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl start nfs-server
fi

systemctl status nfs-server

#read -p "Press enter to continue"

yum install telnet -y

firewall-cmd --permanent --add-service=nfs --add-service=rpc-bind --add-service=mountd
firewall-cmd --reload
firewall-cmd --list-all

showmount -e localhost

<<COMMENT
showmount -e localhost
mkdir /nfsshare
echo "/nfsshare *(rw)" >> /etc/exports
exportfs -av
showmount -e localhost
COMMENT
