nagios
check_by_ssh
su - nagios
ssh nagios@1.1.1.1 uptime
ssh nagios@1.1.1.1 /home/nagios/plugins/check_oracle --tablespace XX sysmon sysmon YY 98 95
