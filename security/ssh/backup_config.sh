echo '* backup config'
test -d backup || echo '- mkdir backup directory'; mkdir backup
cp /etc/ssh/sshd_config backup/sshd_config-`date +%Y%m%d.%H%M%S` 
if (( $? == 0 )); then echo '- good'; else echo '- bad'; fi
