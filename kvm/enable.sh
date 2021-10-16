dnf -y install libvirt
systemctl --no-pager status libvirtd
systemctl enable libvirtd
systemctl start libvirtd
virt-host-validate

# dnf -y install epel-release
dnf -y install libguestfs-tools
osinfo-query os
virt-builder --note cirros0.4.0
virt-builder fedora-27 --root-password password:123456
virt-install \
   --name f27vm1 --ram 1024 \
   --disk path=fedora-27.img,format=raw \
   --os-variant fedora27 \
   --import
