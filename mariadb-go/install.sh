#!/usr/bin/env bash

### ENV
FILE=mariadb-10.2.32-linux-x86_64.tar.gz
BASEDIRORIG=/usr/local/mariadb-10.2.32-linux-x86_64
BASEDIR=/usr/local/mariadb
DATADIR=/u01/mariadb

### PRE : LIMIT
#cp -f mariadb-limits.conf /etc/security/limits.d
grep maria /etc/security/limits.conf &>/dev/null || cat >> /etc/security/limits.conf <<EOF
maria      soft    nproc     65536
maria      hard    nproc     65536
maria      soft    nofile    65536
maria      hard    nofile    65536
EOF

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
# cp mysql.server /etc/init.d/mysqld
cp ${BASEDIR}/support-files/mysql.server /etc/init.d/mysqld
chown maria.maria /etc/init.d/mysqld
#cp mysqld.service /etc/systemd/system/mariadb.service
ls /etc/systemd/system/mariadb.service &>/dev/null || cat >> /etc/systemd/system/mariadb.service <<EOF
[Unit]
Description = MySQL Server
After = network.target

[Service]
Type = forking
User = maria
ExecStart = /etc/init.d/mysqld start
ExecStop = /etc/init.d/mysqld stop
LimitNOFILE=65536

[Install]
WantedBy = multi-user.target
EOF

systemctl start mariadb.service
# /usr/local/mariadb/bin/mysqladmin ping

### SUDO
grep maria /etc/sudoers &>/dev/null|| echo 'maria ALL=NOPASSWD: /usr/bin/systemctl status mariadb, /usr/bin/systemctl stop mariadb, /usr/bin/systemctl start mariadb' >> /etc/sudoers

### LAST
echo installation complete. 

