sudo apt-get -q -y remove docker docker-engine docker.io containerd runc 
sudo apt-get -q -y update
sudo apt-get -q -y install ca-certificates curl gnupg lsb-release 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list 
sudo apt-get -q -y update
sudo apt-get -q -y install docker-ce docker-ce-cli containerd.io 
sudo apt-cache madison docker-ce
sudo docker run hello-world
