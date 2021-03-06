# net.ipv6.conf.all.disable_ipv6=1
# net.ipv6.conf.default.disable_ipv6=1
# net.ipv6.conf.lo.disable_ipv6=1

sudo yum install -y bash-completion psmisc git

sudo timedatectl set-timezone Asia/Seoul

sudo su - root -c 'git clone https://github.com/taeyoungchoon/t-shell.git'
sudo su - root -c 'cd /root/t-shell/openstack/tripleo/single/inside; sh user.sh'

sudo su - stack -c 'git clone https://github.com/taeyoungchoon/t-shell.git'
sudo su - stack -c 'ln -s /home/stack/t-shell/openstack/tripleo/single/stack .'
