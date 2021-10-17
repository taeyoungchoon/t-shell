dnf -y install libvirt virt-install
systemctl --no-pager status libvirtd
systemctl enable libvirtd
systemctl start libvirtd
virt-host-validate

# dnf -y install epel-release
dnf -y install libguestfs-tools
#osinfo-query os
usermod -a -G kvm root
#usermod -a -G kvm vagrant
