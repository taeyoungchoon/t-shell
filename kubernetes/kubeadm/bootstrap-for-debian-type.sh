timedatectl set-timezone Asia/Seoul
swapoff -a
apt-get -q -y install git make psmisc 
apt-get -q -y install ethtool socat iptables ebtables conntrack
# id
cd /root
git clone https://github.com/taeyoungchoon/t-shell.git
cd ~/t-shell/kubernetes/kubeadm

# --0
make os
make docker
make the-k
sleep 60
make deploy
make check
sleep 60
make check

# sh os.sh
# sh docker.sh
# sh the-k.sh
# sh test.sh