# users and groups part 1

user='nagios'
if getent passwd $user &>/dev/null; then
	echo "user $user exist";
else
	useradd $user;
fi

group='nagcmd'
if getent group $group &>/dev/null; then
	echo "group $group exist";
else
	groupadd $group;
fi

user='nagios'
group='nagcmd'
if groupmems -l -g $group | grep -w $user &>/dev/null; then
	echo "user $user belongs to $group group";
else
	usermod -a -G $group $user
fi

user='apache'
group='nagcmd'
if groupmems -l -g $group | grep -w $user&>/dev/null; then
	echo "user $user belongs to $group group";
else
	usermod -a -G $group $user
fi

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
