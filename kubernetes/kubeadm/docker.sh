sudo apt-get -qq remove docker docker-engine docker.io containerd runc 
sudo apt-get -qq update
sudo apt-get -qq install ca-certificates curl gnupg lsb-release &>/dev/null
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -qq update
sudo apt-get -qq install docker-ce docker-ce-cli containerd.io &>/dev/null
sudo apt-cache madison docker-ce
sudo docker run hello-world
