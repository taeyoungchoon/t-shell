dnf install libvirt -y
systemctl --no-pager status libvirtd
systemctl enable libvirtd
systemctl start libvirtd
virt-host-validate
