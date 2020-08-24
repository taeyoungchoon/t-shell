#!/usr/bin/env bash

### ENV
BASEDIR=/usr/local/mariadb-10.2.32
BASEDIRALIAS=/usr/local/mariadb
DATADIR=/u01/mariadb
BKDIR=/dbbackup

### PRE
mkdir -p $BKDIR
chown -R maria.maria $BKDIR
mkdir -p /home/maria/bin

### BACKUP
echo "mariabackup --defaults-file=/etc/my.cnf --user=root --password='123\$qwer' --target-dir=/dbbackup --backup" > /home/maria/bin/1.backup.sh
echo "mariabackup --defaults-file=/etc/my.cnf --user=root --password='123\$qwer' --target-dir=/dbbackup --prepare" > /home/maria/bin/2.prepare.sh
echo 'cat /dbbackup/xtrabackup_checkpoints' > /home/maria/bin/3.check.sh
