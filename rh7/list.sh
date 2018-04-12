for i in iptables ip6tables ebtables;
do 
	systemctl list-unit-files | grep $i | grep -w masked
done
