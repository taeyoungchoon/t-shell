yum install samba-client -y
smbclient -L 192.168.33.100 -N
smbclient -L 192.168.33.100 -U jack
mkdir /smbshare
mount -t cifs -o username=jack,password=redhat //192.168.33.100/smbshare /mnt/smbshare
mount -t cifs -o credentials=/etc/passwd.samba //192.168.33.100/smbshare /mnt/smbshare
mount -t cifs -o credentials=/etc/passwd.samba,sec=ntlmssp,multiuser,_netdev //192.168.33.100/smbshare /mnt/smbshare
