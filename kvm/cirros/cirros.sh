virsh pool-list
virsh vol-list default

virsh vol-create-as default ci0.qcow2 128M --format qcow2
virsh vol-upload ci0.qcow2 cirros-0.4.0-x86_64-disk.qcow2 --pool default

# later full bridge
# https://linuxconfig.org/how-to-use-bridged-networking-with-libvirt-and-kvm
ip a s dev virbr0
cat /var/lib/libvirt/dnsmasq/default.conf

virt-install --name ci0 --memory 512 --vcpus 1 --import --os-variant cirros0.4.0 --disk=/var/lib/libvirt/images/ci0.qcow2,format=qcow2,bus=virtio --network network=default --graphics vnc,keymap=local --noautoconsole
