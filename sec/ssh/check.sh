echo check process
sshd -T | grep -i 'permitrootlogin no' &>/dev/null
if (( $? == 0 )); then echo good; else echo bad; fi

echo check config
grep -i "^PermitRootLogin no" /etc/ssh/sshd_config &>/dev/null
if (( $? == 0 )); then echo good; else echo bad; fi
