for ip in `openstack server list  -c Networks -f value | cut -d "=" -f 2`; do
	nmap -sP $ip | grep "Host is up" 1>/dev/null 2>/dev/null
	if test $? -eq 0; then
		echo "$ip -> UP"
	else
		echo "$ip -> DW"
		# echo -ne '\007\007\007'
	fi
done

