# nmcli --terse connection show | cut -d : -f 1 | \
#   while read name; do echo nmcli connection delete "$name"; done
nmcli -t -f name | \
while read name; do 
	echo nmcli connection delete "$name"; 
done
