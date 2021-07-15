# install plugins
cd /tmp
wget https://nagios-plugins.org/download/nagios-plugins-2.3.3.tar.gz
tar -zxvf nagios-plugins-2.3.3.tar.gz
cd /tmp/nagios-plugins-2.3.3/

./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
make install
