sudo dnf -y install libvirt virt-install libguestfs-tools
# sudo dnf -y install epel-release

sudo systemctl --no-pager status libvirtd
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo virt-host-validate

# sudo usermod -a -G kvm vagrant
