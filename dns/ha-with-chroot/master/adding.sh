awk -i inplace '/soa/ { $6++; print }; ! /soa/ { print }' /var/named/t.com.db
hostname=t$RANDOM
ip=$(( ( RANDOM % 10 ) +1 )).$(( ( RANDOM % 10 ) +1 )).$(( ( RANDOM % 10 ) +1 )).$(( ( RANDOM % 10 ) +1 ))
5432    A       3.3.3.3
printf "%s\tA\t%s" $hostname $ip >> /var/named/t.com.db
rndc reload
host $hostname.t.com 172.20.0.102
