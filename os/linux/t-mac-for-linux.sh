hn=`hostname`
int=`netstat -rn | grep UG | awk '{ print $8 }'`
ip=`ifconfig $int | grep -v inet6 | grep inet | awk '{ print $2 }'`
mac=`ifconfig $int | grep ether | awk '{ print $2 }'`
echo $hn $int $ip $mac
