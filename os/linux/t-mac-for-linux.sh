hn=`hostname`
int=`netstat -rn | grep UG | awk '{ print $8 }'`
ip=`ifconfig $int | grep -v inet6 | grep inet | awk '{ print $2 }'`
mac=`ifconfig $int | grep ether | awk '{ print $2 }'`
echo $hn $int $ip $mac

hn=`hostname`
int=`netstat -rn | grep UG | awk '{ print $8 }'`
ip=`ifconfig $int | grep -v inet6 | grep inet | awk '{ print $2 }' | cut -d ':' -f 2`
mac=`ifconfig $int | grep HWaddr | awk '{ print $5 }'`
echo $hn $int $ip $mac

# but two
hostname
netstat -rn | grep ^[0-9] | awk '{ print $8 }' | grep -v usb | grep -v lo | sort | uniq | wc -l
netstat -rn | grep ^[0-9] | awk '{ print $8 }' | sort | uniq | sed 's/^/ifconfig /' | sh | egrep "(HWaddr|inet)" | grep -v inet6

# aix
hostname
netstat -rn | grep \= | awk '{ print $6 }' 
ifconfig en0 | grep inet | awk '{ print $2 }'
entstat ent0 | grep -i hardware | awk '{ print $3 }'

# enhancing but
echo `netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq | wc -l`
echo ''
hn=`hostname`
int=`netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq`
#echo $int
ip=`ifconfig $int | grep inet | awk '{ print $2 }'`
#echo $ip
mac=`entstat $int | grep -i hardware | awk '{ print $3 }'`
echo $hn $int $ip $mac

# but two
hostname
netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq
netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq | sed 's/^/ifconfig /'  | sh
netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq | sed 's/^/entstat /' | sh | egrep "(ETH|Har)"

# win
hostname
netstat -rn | findstr Default
netsh int ipv4 show route | findstr x.x.x.x
netstat -rn | findstr x
ipconfig /all | findstr /c:Desc /c:Phys /c:IPv4



