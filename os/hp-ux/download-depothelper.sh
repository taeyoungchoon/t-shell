ftp -in hpux.connect.org.uk << DONE
user anonymous foo@bar.com
binary
hash
bell
prompt
cd hpux/Sysadmin/depothelper-2.00
get depothelper-2.00-hppa-11.11.depot.gz
get depothelper-2.00-ia64-11.23.depot.gz
get depothelper-2.00-ia64-11.31.depot.gz
DONE
ls -l depothelper*
