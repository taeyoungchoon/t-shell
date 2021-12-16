sudo apt-get -q -y update
sudo apt-get -q -y install -y apt-transport-https ca-certificates curl 

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get -q -y update
sudo apt-get -q -y install kubelet kubeadm kubectl 
sudo apt-mark hold kubelet kubeadm kubectl

# kubeadm config images pull
kubeadm init --pod-network-cidr=10.244.0.0/16

# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config

export KUBECONFIG=/etc/kubernetes/admin.conf

# kubectl get all -n kube-system

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# kubeadm join 10.0.2.15:6443 --token gdolod.m2dwsjd3qj1dege2 \
#	--discovery-token-ca-cert-hash sha256:f4eac629be3fd4464ec05e633457146c0c5a991c7b5b6befa405ea28d0d4fc8f

kubectl taint nodes --all node-role.kubernetes.io/master-

# kubectl get all -n kube-system

echo done
