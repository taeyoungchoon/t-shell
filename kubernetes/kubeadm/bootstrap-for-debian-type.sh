swapoff -a
apt install git make psmisc -y
# id
cd /root
git clone https://github.com/taeyoungchoon/t-shell.git
cd ~/t-shell/kubernetes/kubeadm

# --0
make os
make docker
make the-k
make deploy
make check

# sh os.sh
# sh docker.sh
# sh the-k.sh
# sh test.sh
