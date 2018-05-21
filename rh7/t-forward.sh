echo "man firewalld.richlanguage | grep to-port:" 
man firewalld.richlanguage | grep to-port | sed 's/^\s*//'

echo
echo "cli:"
firewall-cmd --permanent --add-rich-rule='rule family=ipv4 source address=192.168.33.200 forward-port port=8080 protocol=tcp to-port=80' 2>/dev/null >/dev/null
firewall-cmd --reload >/dev/null
firewall-cmd --list-rich-rules

<<COMMENT
yum upgrade firewalld
COMMENT
