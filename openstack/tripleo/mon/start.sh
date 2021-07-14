# /usr/local/nagios/bin/nagios -d -v /usr/local/nagios/etc/nagios.cfg
systemctl enable httpd
systemctl restart httpd
systemctl enable nagios
systemctl restart nagios
