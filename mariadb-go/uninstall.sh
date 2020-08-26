#!/usr/bin/env bash

### ENV
BASEDIR=/usr/local/mariadb-10.2.32
BASEDIRALIAS=/usr/local/mariadb
DATADIR=/u01/mariadb

systemctl stop mariadb &>/dev/null

rm -rf $DATADIR
rm -rf $BASEDIRALIAS
rm -rf $BASEDIR

userdel -r maria &>/dev/null

rm -f /etc/my.cnf
rm -f /etc/security/limits.d/mariadb-limits.conf
rm -f /etc/systemd/system/mariadb.service
rm -f /etc/init.d/mysqld

sed -i '/^maria/d' /etc/sudoers
sed -i '/^maria/d' /etc/security/limits.conf
