awk -i inplace '/soa/ { $6++; print }; ! /soa/ { print }' /var/named/t.com.db
hostname=t$RANDOM
ip=$(( ( RANDOM % 10 ) +1 )).$(( ( RANDOM % 10 ) +1 )).$(( ( RANDOM % 10 ) +1 )).$(( ( RANDOM % 10 ) +1 ))
printf "%s\tA\t%s\n" $hostname $ip >> /var/named/t.com.db
rndc reload t.com
sleep 3
host $hostname.t.com 172.20.0.102
