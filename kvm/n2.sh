#VM=$(vboxmanage list vms | cut -d ' ' -f 1|cut -d" -f 2)
#echo $VM
#sudo vboxmanage modifyvm $(vboxmanage list vms | cut -d'"' -f 2) --nested-hw-virt on
sudo vboxmanage modifyvm $(vboxmanage list vms | cut -d '"' -f 2) --nested-hw-virt on
