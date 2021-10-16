dnf install libvirt -y
systemctl status libvirtd
systemctl enable libvirtd
systemctl start libvirtd
virt-host-validate
