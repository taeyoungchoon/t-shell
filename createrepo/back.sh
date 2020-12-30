rm -rf /usr/share/nginx/html/repo
rm -f /etc/yum.repos.d/localhost_repo.repo

yum-config-manager --enable base
yum-config-manager --enable updates
yum-config-manager --enable extras

yum clean all
yum repolist

yum remove -y createrepo nginx

