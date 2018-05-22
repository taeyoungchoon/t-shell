rpm -qi chrony >/dev/null 2>/dev/null
if test $? -ne 0; then
	yum install chrony -y
fi

systemctl is-enabled chronyd >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl enable chronyd
fi

systemctl is-active chronyd >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl start chronyd
fi

if [ $(which timedatectl) ] && timedatectl >/dev/null 2>/dev/null; then
	timedatectl | grep "NTP enabled"
fi

# one more thing
if [ $(which timedatectl) ] && timedatectl >/dev/null 2>/dev/null; then
	timedatectl | grep KST >/dev/null 2>/dev/null
	if test $? -ne 0; then
		timedatectl set-timezone Asia/Seoul
	fi
	timedatectl | grep Local
fi

sourcing=`chronyc sources | grep "\^\*" | wc -l`
if test $sourcing -ne 1; then
	systemctl restart chronyd
	sleep 3
fi

gap=`chronyc tracking | grep ^System | awk '{ print $4 }' |  cut -d "." -f 1`
if test $gap -ne 0; then
	chronyc makestep
fi
