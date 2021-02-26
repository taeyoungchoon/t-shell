echo "* fix case '#Banner none'"
grep -q '#Banner none' /etc/ssh/sshd_config
if (( $? == 0 )); then 
	sed -i 's!#Banner none!Banner /etc/ssh/banner!' /etc/ssh/sshd_config
	if (( $? == 0 )); then echo '- good'; else echo '- bad'; fi
else
	echo '- bad'
fi
