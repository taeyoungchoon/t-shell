rm -rf /usr/share/nginx/html/repo
rm -f /etc/yum.repos.d/localhost_repo.repo

yum-config-manager --enable base >/dev/null
yum-config-manager --enable updates >/dev/null
yum-config-manager --enable extras >/dev/null

yum clean all
yum repolist

yum remove -y createrepo nginx

