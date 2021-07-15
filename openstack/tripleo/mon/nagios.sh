# users and groups part 1
useradd nagios
groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd apache

# install nagios only
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

# users and groups part 2
htpasswd -c -b /usr/local/nagios/etc/htpasswd.users nagiosadmin 1234qwer
