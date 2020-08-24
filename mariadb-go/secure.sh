### ENV
PASS='123$qwer'
BASEDIR=/usr/local/mariadb

### GO
${BASEDIR}/bin/mysql_secure_installation --basedir=${BASEDIR} <<EOF &>/dev/null

y
secret
secret
y
y
y
y
EOF

${BASEDIR}/bin/mysqladmin -uroot -psecret password ${PASS}
echo being secure complete.
