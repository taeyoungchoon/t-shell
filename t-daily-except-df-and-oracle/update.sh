ftp -in 192.168.1.100 << DONE
user sysman passpass
binary
cd t-shell
mget *
DONE
