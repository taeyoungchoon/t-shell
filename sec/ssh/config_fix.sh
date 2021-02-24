echo try to type 1 fix
grep '#PermitRootLogin yes' /etc/ssh/sshd_config &>/dev/null
if (( $? == 0 )); then 
	sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
else
	echo not fit
fi
