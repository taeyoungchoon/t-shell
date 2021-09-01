sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack
cp -a ../as-stack /opt/stack/
chmod 755 /opt/stack
chown -R stack.stack /opt/stack
# one more thing before you go
yum install systemd-devel libibverbs -y
# fine
# sudo su - stack
