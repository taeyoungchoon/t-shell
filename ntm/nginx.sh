wget http://nginx.org/packages/centos/7/x86_64/RPMS/nginx-1.18.0-1.el7.ngx.x86_64.rpm
yum -y localinstall nginx-1.18.0-1.el7.ngx.x86_64.rpm 
systemctl start nginx
systemctl status nginx
