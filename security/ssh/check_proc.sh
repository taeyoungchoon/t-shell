echo '* check sshd process'
#echo ''
#pstree -A | grep -i sshd
#pstree -A -p | grep -i sshd
#pidof sshd
#pgrep -a sshd
#echo ''
CNT=`ps -eo ppid,comm | grep [s]shd | awk '{ print $1 }' | grep '^1$' | wc -l`
if (( $CNT == 1 )); then echo '- good'; else 
    echo '- bad'; 
    echo "  - number of odd parent sshd : $CNT"
fi

#if (( $? == 0 )); then echo '- good'; else echo '- bad'; fi

# echo check config
# grep -i "^PermitRootLogin no" /etc/ssh/sshd_config &>/dev/null
# if (( $? == 0 )); then echo good; else echo bad; fi
