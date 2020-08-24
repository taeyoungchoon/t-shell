visudo
vi /etc/security/limits.conf

su - maria
vi ~maria/.bash_profile

vi support-files/mysql.server
cp mysql.server /etc/init.d/mysqld

cp mysqld.service /etc/systemd/system/mariadb.service

mkdir /u01/mariadb
groupadd maria
useradd -g maria maria
tar -xvzf mariadb-10.2.32-linux-x86_64.tar.gz -C /usr/local/mariadb-10.2.32
cd /usr/local
ln -s mariadb-10.2.32 mariadb
cd mariadb
./scripts/mysql_install_db --defaults-file=/etc/my.cnf

chown -R maria.maria /u01/mariadb/
chown -R maria.maria /usr/local/mariadb
chown -R maria.maria /usr/local/mariadb-10.2.32
chown -R maria.maria /etc/init.d/mysqld
chown -R maria.maria /etc/my.cnf
chown -R maria.maria dbbackup/

su - maria
 vi .bash_profile
. .bash_profile

sudo systemctl start mariadb.service
sudo systemctl status mariadb.service

cd /u01/mariadb/

mysql -u root -p
mysql_secure_installation --basedir=/usr/local/mariadb
mysql -u root -p

mariabackup --defaults-file=/etc/my.cnf --user=root --password='456$qwer' --target-dir=/dbbackup --backup
mariabackup --defaults-file=/etc/my.cnf --user=root --password='456$qwer' --target-dir=/dbbackup --prepare
cat xtrabackup_checkpoints
