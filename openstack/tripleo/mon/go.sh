yum -y install httpd php gcc glibc glibc-common wget perl gd gd-devel unzip zip

useradd nagios
groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd apache

cd /tmp/
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz
tar -zxvf nagios-4.4.6.tar.gz
cd /tmp/nagios-4.4.6

./configure --with-nagios-group=nagios --with-command-group=nagcmd
make all
make install
make install-init
make install-config
make install-commandmode

make install-webconf
make install-exfoliation
# make install-classicui

htpasswd -c -b /usr/local/nagios/etc/htpasswd.users nagiosadmin 1234qwer

systemctl restart httpd
systemctl enable httpd
