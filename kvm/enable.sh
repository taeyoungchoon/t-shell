# 
sudo dnf -y groupinstall "Server with GUI"
sudo dnf -y install epel-release
sudo dnf -y install libvirt virt-install virt-viewer libguestfs-tools virt-manager sshpass expect

#
sudo systemctl --no-pager status libvirtd
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo virt-host-validate

# sudo usermod -a -G kvm vagrant

sudo virsh pool-define-as --name default --type dir --target /var/lib/libvirt/images/
sudo virsh pool-autostart default
sudo virsh pool-start default
