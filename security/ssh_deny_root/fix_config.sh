echo "* fix case '#PermitRootLogin yes'"
grep '#PermitRootLogin yes' /etc/ssh/sshd_config &>/dev/null
if (( $? == 0 )); then 
	sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
	if (( $? == 0 )); then echo '- good'; else echo '- bad'; fi
else
	echo '- bad'
fi
