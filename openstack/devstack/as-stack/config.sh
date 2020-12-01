cat local.conf.head > local.conf
IP=`ip -br a s eth1 | cut -d '/' -f 1 | awk '{ print $NF }'`
echo "HOST_IP=" $IP
cat local.conf.tail > local.conf
