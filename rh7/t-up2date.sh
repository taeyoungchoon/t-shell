#rpm -qa | cut -d "-" -f 1 | grep -v kernel | sed 's/^/yum upgrade -y /' | sh
yum upgrade -y
