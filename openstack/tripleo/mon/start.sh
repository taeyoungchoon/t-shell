service='httpd';
systemctl is-enabled $service || systemctl enable $service
systemctl is-active $service || systemctl start $service

service='nagios';
systemctl is-enabled $service || systemctl enable $service
systemctl is-active $service || systemctl start $service
