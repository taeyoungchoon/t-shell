#!/usr/bin/env bash

### ENV
BASEDIR=/usr/local/mariadb-10.2.32
BASEDIRALIAS=/usr/local/mariadb
DATADIR=/u01/mariadb
BKDIR=/dbbackup

systemctl stop mariadb &>/dev/null

rm -rf $BKDIR
rm -rf $DATADIR
rm -rf $BASEDIRALIAS
rm -rf $BASEDIR
rm -rf $BKDIR

userdel -r maria &>/dev/null

rm -f /etc/my.cnf
rm -f /etc/security/limits.d/mariadb-limits.conf
rm -f /etc/systemd/system/mariadb.service
rm -f /etc/init.d/mysqld

sed -i '/^maria/d' /etc/sudoers
