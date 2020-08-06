add repo of ansible then do something
yum install x.rpm --downloadonly
cd /var/cache/x
createrepo .
yum-config-x --add-repo
yum install x
# sudo yum localinstall *.rpm -y
