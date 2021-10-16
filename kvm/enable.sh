dnf -y install libvirt
systemctl --no-pager status libvirtd
systemctl enable libvirtd
systemctl start libvirtd
virt-host-validate

# dnf -y install epel-release
dnf -y install libguestfs-tools
osinfo-query os
#usermod -a -G kvm root
#usermod -a -G kvm vagrant
#virt-builder --note cirros0.4.0
virt-builder fedora-25 --root-password password:123456
virt-install \
   --name f25vm1 --ram 1024 \
   --disk path=fedora-25.img,format=raw \
   --os-variant fedora25 \
   --import
