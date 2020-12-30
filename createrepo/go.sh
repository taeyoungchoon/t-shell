yum install -y createrepo nginx
mkdir -p /usr/share/nginx/html/repo/rpms
cd /usr/share/nginx/html/repo/rpms
wget http://nginx.org/packages//centos/7/x86_64/RPMS/nginx-1.8.0-1.el7.ngx.x86_64.rpm
cd /usr/share/nginx/html/repo
createrepo .

yum repolist
yum-config-manager --disable base
yum-config-manager --disable updates
yum-config-manager --disable extras

yum-config-manager --add-repo=http://localhost/repo
echo 'gpgcheck=0' >> /etc/yum.repos.d/localhost_repo.repo
yum clean all
yum repolist
yum search nginx

cd /usr/share/nginx/html/repo/rpms
wget http://nginx.org/packages//centos/7/x86_64/RPMS/nginx-debug-1.8.0-1.el7.ngx.x86_64.rpm
wget http://nginx.org/packages//centos/7/x86_64/RPMS/nginx-debuginfo-1.8.0-1.el7.ngx.x86_64.rpm
cd /usr/share/nginx/html/repo
createrepo .
yum repolist
yum clean all
yum repolist
yum search nginx
