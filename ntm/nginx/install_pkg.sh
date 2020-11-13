rpm -qa nginx | grep nginx >/dev/null 2>/dev/null
if test $? -eq 0; then
    echo "installed"
else
    echo "not installed"
    wget --no-clobber -q http://nginx.org/packages/centos/7/x86_64/RPMS/nginx-1.18.0-1.el7.ngx.x86_64.rpm
    yum -y -q localinstall nginx-1.18.0-1.el7.ngx.x86_64.rpm >/dev/null 2>/dev/null
    rm -f nginx-1.18.0-1.el7.ngx.x86_64.rpm
fi

systemctl start nginx
systemctl -q enable nginx

