echo pre
sudo yum -y install epel-release
sudo yum -y install tree psmisc emacs-nox vim
python --version
sudo yum -y install python2-pip

echo install python3 
sudo yum -y install python3 
sudo yum -y install python3-pip

echo make env
pip3 install virtualenv
mkdir workspace
python3 -m virtualenv workspace
source workspace/bin/activate
pip3 install ansible

echo check
python --version
ansible --version
