rpm -qa nginx | grep nginx >/dev/null 2>/dev/null
if test $? -eq 0; then
    echo "removing"
    systemctl stop nginx
    systemctl -q disable nginx
    yum -y -q remove nginx 
    # >/dev/null 2>/dev/null
else
    echo "removed"
fi
