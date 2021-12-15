swapoff -a
apt install git psmisc -y
id
cd /root
git clone https://github.com/taeyoungchoon/t-shell.git
cd ~/t-shell/kubernetes/kubeadm
pwd
sh os.sh
sh pre-docker.sh
sh the-k.sh
