cd /usr/local/nagios/etc/
mkdir servers printers switches routers
sed -i 's/#cfg_dir=/cfg_dir=/' /usr/local/nagios/etc/nagios.cfg
cd -
cp -f cfg/* /usr/local/nagios/etc/servers/
