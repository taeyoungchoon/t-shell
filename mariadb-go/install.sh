#!/usr/bin/env bash

### if ONLINE
# wget -O mariadb-10.2.32-linux-x86_64.tar.gz \
# https://downloads.mariadb.org/interstitial/mariadb-10.2.32/bintar-linux-x86_64/mariadb-10.2.32-linux-x86_64.tar.gz

### ENV
FILE=mariadb-10.2.32-linux-x86_64.tar.gz
BASEDIRORIG=/usr/local/mariadb-10.2.32-linux-x86_64
BASEDIR=/usr/local/mariadb
DATADIR=/u01/mariadb

### PRE : LIMIT
cp -f mariadb-limits.conf /etc/security/limits.d

### INSTALL
mkdir -p $DATADIR
cp -f my.cnf /etc
getent group maria &>/dev/null || groupadd maria
id -u maria &>/dev/null || useradd -g maria maria
tar xfz $FILE -C /usr/local
cd /usr/local
ln -s $(basename $BASEDIRORIG) mariadb
${BASEDIR}/scripts/mysql_install_db --defaults-file=/etc/my.cnf &>/dev/null
chown -R maria.maria $DATADIR
chown -R maria.maria $BASEDIR
chown -R maria.maria $BASEDIRORIG
chown -R maria.maria /etc/my.cnf

### BASH
grep maria /home/maria/.bash_profile &>/dev/null || echo 'PATH=$PATH:/usr/local/mariadb/bin; export PATH' >> /home/maria/.bash_profile

### SERVICE
cd - &>/dev/null
cp mysql.server /etc/init.d/mysqld
chown maria.maria /etc/init.d/mysqld
cp mysqld.service /etc/systemd/system/mariadb.service
systemctl start mariadb.service
# /usr/local/mariadb/bin/mysqladmin ping

### SUDO
grep maria /etc/sudoers &>/dev/null|| echo 'maria ALL=NOPASSWD: /usr/bin/systemctl status mariadb, /usr/bin/systemctl stop mariadb, /usr/bin/systemctl start mariadb' >> /etc/sudoers

### LAST
echo installation complete. 

