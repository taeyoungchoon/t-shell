mkdir /dbbackup
cd /usr/local/mysql
./mariabackup -u root --password='123$qwer' --target-dir=/dbbackup --backup
./mariabackup -u root --password='123$qwer' --target-dir=/dbbackup --prepare
cat /dbbackup/xtrabackup_checkpoints
