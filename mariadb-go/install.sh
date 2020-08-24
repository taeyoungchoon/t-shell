#!/usr/bin/env bash

### ENV
BASEDIR=/usr/local/mariadb-10.2.32
BASEDIRALIAS=/usr/local/mariadb
DATADIR=/u01/mariadb

### LIMITS
cp -f mariadb-limits.conf /etc/security/limits.d

### if ONLINE
# wget -O mariadb-10.2.32-linux-x86_64.tar.gz \
# https://downloads.mariadb.org/interstitial/mariadb-10.2.32/bintar-linux-x86_64/mariadb-10.2.32-linux-x86_64.tar.gz

### INSTALL
mkdir -p $DATADIR
cp -f my.cnf /etc
getent group maria &>/dev/null || groupadd maria
id -u maria &>/dev/null || useradd -g maria maria
tar xfz mariadb-10.2.32-linux-x86_64.tar.gz -C /usr/local
cd /usr/local
mv mariadb-10.2.32-linux-x86_64 mariadb-10.2.32
ln -s mariadb-10.2.32 mariadb
./mariadb/scripts/mysql_install_db --defaults-file=/etc/my.cnf &>/dev/null
chown -R maria.maria $DATADIR
chown -R maria.maria /usr/local/mariadb
chown -R maria.maria /usr/local/mariadb-10.2.32
chown -R maria.maria /etc/my.cnf

### BASH
echo 'PATH=$PATH:/usr/local/mariadb/bin; export PATH' >> /home/maria/.bash_profile

### SERVICE
cd -
cp mysql.server /etc/init.d/mysqld
chown maria.maria /etc/init.d/mysqld
cp mysqld.service /etc/systemd/system/mariadb.service
systemctl start mariadb.service
# /usr/local/mariadb/bin/mysqladmin ping

### POST
grep maria /etc/sudoers || echo 'maria ALL=NOPASSWD: /usr/bin/systemctl status mariadb, /usr/bin/systemctl stop mariadb, /usr/bin/systemctl start mariadb' >> /etc/sudoers

### LAST
echo installation complete. 
