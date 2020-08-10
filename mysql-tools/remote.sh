[root@jo ~]# ls /backup/
[root@jo ~]# tar cfz xtrabackup_backupfiles-`date +%Y%m%d.%H%M%S`.tar.gz xtrabackup_backupfiles
[root@jo ~]# du -hs xtrabackup_backupfiles
14M     xtrabackup_backupfiles
[root@jo ~]# ls -l xtrabackup_backupfiles-20200810.005747.tar.gz
-rw-r--r--. 1 root root 205242 Aug 10 00:57 xtrabackup_backupfiles-20200810.005747.tar.gz
[root@jo ~]# sshpass -p '123$qwer' scp xtrabackup_backupfiles-20200810.005747.tar.gz localhost:/backup
[root@jo ~]# ls /backup/
xtrabackup_backupfiles-20200810.005747.tar.gz
[root@jo ~]#
