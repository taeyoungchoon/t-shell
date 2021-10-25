# 
sudo dnf -y groupinstall "Server with GUI"
sudo dnf -y install libvirt virt-install virt-viewer libguestfs-tools virt-manager
# sudo dnf -y install epel-release

#
sudo systemctl --no-pager status libvirtd
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo virt-host-validate

# sudo usermod -a -G kvm vagrant
